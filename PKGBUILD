# Maintainer: Lari Tikkanen <lartza@wippies.com>
pkgname=tint3-cpp-git
pkgver=r691.9c13801
pkgrel=1
pkgdesc="A C++ rewrite attempt of the tint2 panel."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/jmc-88/tint3"
license=('GPL3')
depends=('imlib2' 'pango' 'libxinerama' 'libxrandr' 'libxcomposite' 'startup-notification')
makedepends=('git' 'cmake')
source=('tint3::git+https://github.com/jmc-88/tint3.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/tint3"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/tint3"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  make -C "$srcdir/tint3" DESTDIR="$pkgdir" install
}

