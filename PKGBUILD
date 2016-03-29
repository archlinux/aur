# Maintainer: Thomas Nixon <tom@tomn.co.uk>
pkgname=shet-c-git
pkgver=r4.45fd0ee
pkgrel=1
pkgdesc="SHET client library, written in C."
arch=("i686" "x86_64")
url="https://github.com/18sg/SHETC"
license=('MIT')
depends=('json-c')
makedepends=('git' 'scons')
source=('git+https://github.com/18sg/SHETC.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/SHETC"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/SHETC"
  scons installdir=/usr
}

package() {
  cd "$srcdir/SHETC"
  scons installdir="$pkgdir/usr" install

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
