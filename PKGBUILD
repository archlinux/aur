# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=jdsp4linux-gui-git
pkgver=1.1.r5.gc03eecb
pkgrel=1
pkgdesc="User Interface for JamesDSP on Linux"
arch=('x86_64')
url="https://github.com/ThePBone/JDSP4Linux-GUI"
license=('GPL3')
depends=('jdsp4linux-git' 'qt5-multimedia' 'mesa')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ThePBone/JDSP4Linux-GUI.git"
        "${pkgname%-git}.desktop")
sha256sums=('SKIP'
            'fa8ed0bee321c7fed6d2368d0bdf6fd12a3318e324bbda50ec6dbe7e3b784794')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  qmake
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 jdsp-gui -t "$pkgdir/usr/bin"
  install -Dm644 "$srcdir/${pkgname%-git}.desktop" -t \
    "$pkgdir/usr/share/applications"
  install -Dm644 icons/icon.png \
    "$pkgdir/usr/share/pixmaps/jdsp-gui.png"
}
