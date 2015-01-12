# Maintainer: oi_wtf <brainpower at gulli dot com>

pkgname=sfgui-git
pkgver=0.2.3.r1.g5a17f40
pkgrel=3
pkgdesc="SFGUI (Simple and Fast Graphical User Interface), a C++ GUI library for SFML."
arch=('i686' 'x86_64')
url="http://sfgui.sfml-dev.org/"
license=('zlib')
depends=('sfml-git')
makedepends=('cmake' 'git')
provides=('sfgui')
conflicts=('sfgui')
replaces=('sfgui')
options=('debug')

source=("git+https://github.com/TankOs/SFGUI.git"
        "0001-add_cmake_module_install.patch")
sha256sums=('SKIP'
            '7015fd528b2f40f35dc917bc76364a92dd34aaacdd86e1571d2855c3e235a8f1')

pkgver() {
  cd "${srcdir}/SFGUI"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/SFGUI"
  patch -p0 -i "${srcdir}/0001-add_cmake_module_install.patch"
}

build() {
  cd "$srcdir/SFGUI"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo .
  make
}

package() {
  cd "$srcdir/SFGUI"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  install -Dm644 ./FONT.LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/FONT.LICENSE

}

# vim:set ts=2 sw=2 et:
