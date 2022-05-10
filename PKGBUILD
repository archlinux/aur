# Maintainer: Shuyuan Liu <liu_shuyuan at qq dot com>

pkgname=lrpt-pp-git
pkgver=r20.d6cfdb7
pkgrel=1
pkgdesc="Meteor LRPT image post-processor"
arch=(any)
license=('MIT')
url="https://github.com/dbdexter-dev/lrpt_pp"
depends=(gtk3)
makedepends=(git cmake)
provides=(lrpt-pp)
conflicts=(lrpt-pp)
source=("$pkgname::git+https://github.com/dbdexter-dev/lrpt_pp.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}

