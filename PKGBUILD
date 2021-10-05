# Maintainer: xerus <27jf at pm dot me>

_pkgname=context
pkgname=${_pkgname}-bin
pkgver=1.04
pkgrel=1
pkgdesc='ConTeXt LMTX, the Lean and Mean TeX eXperience with Lua, MetaPost, TeX, and XML'
arch=('x86_64')
url="https://wiki.contextgarden.net/Installation"
license=(GPL)
depends=()
provides=("${_pkgname}")
conflicts=("texlive-core")
optdepends=()
source=("http://lmtx.pragma-ade.nl/install-lmtx/context-linux-64.zip")
md5sums=(SKIP)
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
  cat "${srcdir}/tex/texmf-context/scripts/context/lua/mtx-context.xml" |
    grep 'entry name="version"' | sed 's/.*>\(.*\)<.*/\1/'
}
