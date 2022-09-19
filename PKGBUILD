# Maintainer: xeruf <27jf at pm dot me>

_pkgname=context
pkgname=${_pkgname}
pkgver=2022.09.11_20.44
pkgrel=1
pkgdesc='ConTeXt LMTX, the Lean and Mean TeX eXperience with Lua, MetaPost, TeX, and XML'
arch=('x86_64')
url="https://wiki.contextgarden.net/Installation"
license=(GPL)
depends=()
replaces=(context-bin)
provides=(${_pkgname} ${_pkgname}-lmtx)
conflicts=(${_pkgname})
optdepends=()
source=("http://lmtx.pragma-ade.nl/install-lmtx/context-linux-64.zip")
sha256sums=(SKIP)
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
  # TODO use https://wiki.contextgarden.net/LMTX#How_to_check_for_newer_versions.3F
  cat "${srcdir}/tex/texmf-context/tex/context/base/mkxl/context.mkxl" |
    grep "def\\\\contextversion" |
    sed 's/^.*{\(.*\)}.*$/\1/' |
    tr ' :' '_.'
}
