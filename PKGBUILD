# Maintainer: Axel Gembe <derago@gmail.com>
pkgname='plexdrive'
_pkgname=$pkgname
pkgdesc='Plexdrive allows you to mount your Google Drive account as read-only fuse filesystem'
pkgver=5.0.0
pkgrel=1
url='https://github.com/dweidenfeld/plexdrive'
arch=('any')
license=('MIT')
makedepends=(
  'go-pie'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://github.com/dweidenfeld/plexdrive/archive/5.0.0.tar.gz")
sha256sums=('68763993a3da3d8ccd0dc18b3a5db7ab7ad8d03fde2d9be2ef4829e8356225bd')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $_pkgname .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $_pkgname "$pkgdir"/usr/bin/$_pkgname
}
