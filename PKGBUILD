# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.1.0
pkgrel=3
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
sha256sums=('12ff50c1307fd74e2346797ccf208dbfaed5fe74846ce9fc087f0e559cb95530')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -X github.com/twpayne/chezmoi/cmd.version=1.1.0 \
  		   -X github.com/twpayne/chezmoi/cmd.commit=3f93dda \
		   -X github.com/twpayne/chezmoi/cmd.date=20190116"

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

