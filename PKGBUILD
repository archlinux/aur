# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.4.1
pkgrel=6
epoch=
pkgdesc="Multi-machine dotfile management system"
arch=('i686' 'x86_64')
url="https://github.com/twpayne/$pkgname"
license=('MIT')
groups=()
depends=('glibc')
makedepends=(
  'go-pie'
)
source=("$url/archive/v${pkgver}.tar.gz")
sha256sums=('3f7af3da51bfc9aaa6745dbb608040a1a1f9005c8d99ec11cdde91722269c536')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -X github.com/twpayne/chezmoi/cmd.version=1.4.1 \
  		   -X github.com/twpayne/chezmoi/cmd.commit=433cc21 \
		   -X github.com/twpayne/chezmoi/cmd.date=20190320"

  go build \
     -gcflags "all=-trimpath=$PWD" \
     -asmflags "all=-trimpath=$PWD" \
     -ldflags "$extraldflags -extldflags $LDFLAGS" \
     -o $pkgname .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

