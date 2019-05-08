# Author: Tom Payne <twpayne@gmail.com>
# Maintainer:  <godeater@gmail.com>
pkgname=chezmoi
pkgver=1.5.0
pkgrel=10
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
sha256sums=('a3058b6686d8282006e89611b6cd029f2137c21668cae76d52c20ce1419e07e2')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  extraldflags=" -s -w -X github.com/twpayne/chezmoi/cmd.VersionStr=1.5.0 \
  		   -X github.com/twpayne/chezmoi/cmd.Commit=d98b524 \
		   -X github.com/twpayne/chezmoi/cmd.Date=20190503"

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

