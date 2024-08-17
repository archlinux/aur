# Maintainer: Andreas Baumann <mail at andreas baumann dot com>

pkgname=lacc-git
pkgver=r1023.3083984
pkgrel=1
pkgdesc='A simple, self-hosting C compiler'
arch=(x86_64)
url='https://github.com/larmel/lacc'
license=(MIT)
depends=(glibc)
makedepends=(git)
source=(
  git+https://github.com/larmel/lacc
  lacc-path.patch
)
sha1sums=(
  'SKIP'
  '13297866fc99bcc1f651f6afdcad01bee9eebf13'
)

pkgver() {
  cd lacc
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd lacc
  patch -Np1 < "${srcdir}/lacc-path.patch"
}

build() {
  cd lacc
  ./configure --prefix=/usr --build=x86_64-linux
  make
}

check() {
  cd lacc
  make test
}

package() {
  cd lacc
  make DESTDIR="$pkgdir" install
}

