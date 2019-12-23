# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=0.7.0
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Arkweid/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/Arkweid/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('d47be98a7e5e6a7941f2c8337e6734b1570fd4d6eb6f99c6b971f37ee7e897f6')

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