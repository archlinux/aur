# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.4.2
pkgrel=7
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
sha256sums=('682de45f4a17d2d1d691c99a2e422d2180f3b4b6feb01ace27168f96ab9359b2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -X github.com/twpayne/chezmoi/cmd.version=1.4.2 \
  		   -X github.com/twpayne/chezmoi/cmd.commit=31d5fea \
		   -X github.com/twpayne/chezmoi/cmd.date=20190414"

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

