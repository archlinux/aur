# Maintainer: oi_wtf <brainpower at mailbox dot org>

pkgname=sfgui-git
pkgver=0.4.0.r8.g8347159
pkgrel=1
pkgdesc="SFGUI (Simple and Fast Graphical User Interface), a C++ GUI library for SFML."
arch=('i686' 'x86_64')
url="http://sfgui.sfml-dev.org/"
license=('zlib')
depends=('sfml<3.0')
makedepends=('cmake' 'git')
provides=('sfgui')
conflicts=('sfgui')
replaces=('sfgui')
options=('debug')

source=("git+https://github.com/TankOs/SFGUI.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/SFGUI"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/SFGUI"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DSFML_DIR=/usr \
        -DSFGUI_BUILD_EXAMPLES=OFF \
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
