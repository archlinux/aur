pkgname='snorenotify-git'
provides=('snorenotify')
conflicts=('snorenotify')
pkgdesc='a multi platform Qt5 notification framework'
url='https://github.com/Snorenotify/Snorenotify'
arch=('i686' 'x86_64')
pkgver=0.5.0.r31.g82ebb45
pkgrel=1
depends=('qt5-base')
makedepends=('git' 'cmake')
source=('git+https://github.com/Snorenotify/Snorenotify/')
md5sums=('SKIP')

_cd_builddir() {
  cd "$srcdir/Snorenotify"
}

pkgver() {
  _cd_builddir
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//' | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  _cd_builddir
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DLIB_INSTALL_DIR=lib
  make
}

package() {
  _cd_builddir
  make DESTDIR="$pkgdir" install
}
