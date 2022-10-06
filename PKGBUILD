# Maintainer: Douglas Chimento <dchimento@gmail.com>
pkgname=lndmon-git
_name=lndmon
pkgver=r127.2ef0e42
pkgrel=1
pkgdesc="${_name} monitors lnd via prometheus"
url='https://github.com/dougEfish/lndmon'
optdepends=('lnd')
makedepends=('go')
checkdepends=()
license=('MIT')
arch=('any')
source=("git+https://github.com/dougEfresh/lndmon.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_name}"
  install -Dm755 build/$_name "$pkgdir"/usr/bin/$_name
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_name/LICENSE"
}

prepare(){
  cd "$srcdir/${_name}"
  mkdir -p build/
}

build() {
  cd "$srcdir/${_name}"
  go build -o build ./cmd/...
}
