# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.4.0
pkgrel=5
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
sha256sums=('8ab09470142bb659b3398c35c1623ba00f60b000d0e3be2281b2e31efa344dd3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -X github.com/twpayne/chezmoi/cmd.version=1.4.0 \
  		   -X github.com/twpayne/chezmoi/cmd.commit=a27d885 \
		   -X github.com/twpayne/chezmoi/cmd.date=20190311"

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

