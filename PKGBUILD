# Maintainer: xeruf <27jf at pm dot me>

_pkgname=context
pkgname=${_pkgname}
pkgver=2022.01.15_11.45
pkgrel=1
pkgdesc='ConTeXt LMTX, the Lean and Mean TeX eXperience with Lua, MetaPost, TeX, and XML'
arch=('x86_64')
url="https://wiki.contextgarden.net/Installation"
license=(GPL)
depends=()
replaces=(context-bin)
provides=(${_pkgname})
conflicts=(texlive-core)
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
  context="${pkgdir}/usr/share/context"
  cd "tex"

  install -d "$context"
  cp -r texmf texmf-context "$context"
  install -Dt "${pkgdir}/usr/bin" texmf-linux-64/bin/*
}

pkgver() {
  cat "${srcdir}/tex/texmf-context/tex/context/base/mkxl/context.mkxl" |
    grep "def\\\\contextversion" |
    sed 's/^.*{\(.*\)}.*$/\1/' |
    tr ' :' '_.'
}
