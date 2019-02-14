# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.3.0
pkgrel=4
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
sha256sums=('a12308ee89996ab5b7ad73aecf98a6df97d9a893d7955dd046f5e0706b201f1a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -X github.com/twpayne/chezmoi/cmd.version=1.3.0 \
  		   -X github.com/twpayne/chezmoi/cmd.commit=8d19d62 \
		   -X github.com/twpayne/chezmoi/cmd.date=20190130"

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

