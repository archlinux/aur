# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=0.7.5
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('168f3b59acbbf161e46993bc6c48cbf7ba7690030c2202f5f2ea16646da3dc2c')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}