# Maintainer: Lari Tikkanen <lartza@wippies.com>
pkgname=tint3-cpp-git
pkgver=0.3.0.r43.gfc908ec
pkgrel=1
pkgdesc="A C++ rewrite attempt of the tint2 panel."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jmc-88/tint3"
license=('GPL2')
depends=('imlib2' 'pango' 'libxinerama' 'libxrandr' 'libxcomposite' 'startup-notification' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'pandoc' 'xorg-server-xvfb')
source=('tint3::git+https://github.com/jmc-88/tint3.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tint3"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/tint3"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  make -C "$srcdir/tint3" DESTDIR="$pkgdir" install
}

