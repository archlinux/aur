# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.5.6
pkgrel=12
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
sha256sums=('4abd6be864e1e4bd6768e7217247a097233a0351438b1e183dac602959f36750')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -s -w -X github.com/twpayne/chezmoi/cmd.VersionStr=1.5.6 \
  		   -X github.com/twpayne/chezmoi/cmd.Commit=377bed9 \
		   -X github.com/twpayne/chezmoi/cmd.Date=20190607"

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

