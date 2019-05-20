# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.5.5
pkgrel=11
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
sha256sums=('06cadf5e92bda2e4b3bf053714771e23b32ead76df1a8e885e7bc3354d1cf0a9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -s -w -X github.com/twpayne/chezmoi/cmd.VersionStr=1.5.5 \
  		   -X github.com/twpayne/chezmoi/cmd.Commit=4fb74c9 \
		   -X github.com/twpayne/chezmoi/cmd.Date=20190518"

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

