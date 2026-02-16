# Maintainer: pisevren <aur@local>
# Contributor: Timo S. Prinz <t.prinz@coliza.de>

pkgname=librecal-gui
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI application for the LibreCAL, a 4-port eCal module"
arch=('x86_64')
url="https://github.com/jankae/LibreCAL"
license=('GPL-3.0-only')

depends=('qt6-base' 'qt6-charts' 'qt6-svg')
makedepends=('qt6-tools')

# This package ships udev rules; keep compatibility with a potential split package.
provides=('librecal-udev')
conflicts=('librecal-udev')

source=("https://github.com/jankae/LibreCAL/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('46a41f0eb8c75128232cef7e4ac2b3e622de824ec3b475441de0d06c465c7b40')

build() {
  local _src="$srcdir/LibreCAL-${pkgver}/Software/LibreCAL-GUI"
  cd "$_src"
  qmake6 LibreCAL-GUI.pro
  make
}

package() {
  local _top="$srcdir/LibreCAL-${pkgver}/Software"

  install -Dm644 \
    "$_top/52-LibreCAL.rules" \
    "$pkgdir/etc/udev/rules.d/52-LibreCAL.rules"

  install -Dm755 \
    "$_top/LibreCAL-GUI/LibreCAL-GUI" \
    "$pkgdir/usr/bin/LibreCAL-GUI"
}

