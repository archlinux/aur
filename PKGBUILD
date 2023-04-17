# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=1.3.10
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('cf4d299f97a743d671774b2a671278b9519f344af9dda2c84a04c0d72e3071f8')

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