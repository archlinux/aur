# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=sfgui-git
pkgver=0.3.2.r6.gba1d03a
pkgrel=1
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
            'c7001f8d3525fe757cb1ba1b4435c6362545175456426461024850183a57cee6')

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
        -DSFML_DIR=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebugInfo .
  make
}

package() {
  cd "$srcdir/SFGUI"

  make DESTDIR="$pkgdir/" install

  install -Dm644 ./LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  install -Dm644 ./FONT.LICENSE.md ${pkgdir}/usr/share/licenses/${pkgname}/FONT.LICENSE.md

}

# vim:set ts=2 sw=2 et:
