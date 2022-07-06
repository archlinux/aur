# Maintainer: xeruf <27jf at pm dot me>

_pkgname=context
pkgname=${_pkgname}
pkgver=2022.05.11_11.36
pkgrel=1
pkgdesc='ConTeXt LMTX, the Lean and Mean TeX eXperience with Lua, MetaPost, TeX, and XML'
arch=('x86_64')
url="https://wiki.contextgarden.net/Installation"
license=(GPL)
depends=()
replaces=(context-bin)
provides=(${_pkgname} ${_pkgname}-lmtx)
conflicts=()
optdepends=()
source=("http://lmtx.pragma-ade.nl/install-lmtx/context-linux-64.zip")
sha256sums=('7206e62f9059695a02c261369a9eab8239c9de9fec6552ada65c92114966a554')
install=${_pkgname}.install

prepare() {
  cd "${srcdir}"
  chmod +x install.sh
  ./install.sh
}

package() {
  context="${pkgdir}/usr/share/texmf-dist"
  cd "tex"

  install -d "$context"
  cp -r texmf texmf-context "$context"
  install -Dt "${pkgdir}/usr/local/bin" texmf-linux-64/bin/*
}

pkgver() {
  cat "${srcdir}/tex/texmf-context/tex/context/base/mkxl/context.mkxl" |
    grep "def\\\\contextversion" |
    sed 's/^.*{\(.*\)}.*$/\1/' |
    tr ' :' '_.'
}
