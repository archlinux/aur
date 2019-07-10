# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=0.6.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Arkweid/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/Arkweid/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('0d148c1952a39a1fb86df380bbdfac2368f90c67c0e2c421013db27c843bc751')

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