# maintainer: anton \ät semjonov.de

pkgname=updiprog-git
_pkgname=(${pkgname%-git})
pkgdesc="utility for programming AVR devices with UPDI interface using standard TTL serial port"

pkgver=v0.2.r2.3741ea7
pkgrel=1

arch=('x86_64')
url="https://github.com/Polarisru/$_pkgname"
license=('BSD')

depends=()
makedepends=('make' 'git')

provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$pkgname::git+$url.git"
  "Makefile"
)
sha256sums=(
  "SKIP"
  "8145eee13c59c4723ff3b8175c41ea860117fd4fd93cfd18dd176cb74d55cd8a"
)

pkgver() {
  cd "$pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cp Makefile "$pkgname/"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

