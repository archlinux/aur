# Maintainer: Eduardo Bart <edub4rt@gmail.com>
pkgname=nelua
pkgver=0.2.0.r816.8341b61
pkgrel=1
pkgdesc='The Nelua programming language'
arch=('any')
url='https://nelua.io/'
license=('MIT')
depends=('gcc-libs')
makedepends=('git')
source=('git+https://github.com/edubart/nelua-lang.git')
sha1sums=('SKIP')

pkgver() {
  cd nelua-lang
  printf "%s.%s.%s.r%s.%s" \
    "$(git show HEAD:nelua/version.lua | sed -n 's/.*VERSION_MAJOR = //p')" \
    "$(git show HEAD:nelua/version.lua | sed -n 's/.*VERSION_MINOR = //p')" \
    "$(git show HEAD:nelua/version.lua | sed -n 's/.*VERSION_PATCH = //p')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd nelua-lang
  make MYCFLAGS="$CFLAGS" MYLDFLAGS="$LDFLAGS" PREFIX=/usr
}

check() {
  cd nelua-lang
  ./nelua.sh tests/all_test.nelua
}

package() {
  cd nelua-lang
  make install DESTDIR="$pkgdir" PREFIX=/usr
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
