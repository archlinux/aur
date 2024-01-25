# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=1.6.1
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/evilmartians/lefthook"
license=('MIT')
makedepends=('go>=1.21' 'rsync')
source=("https://github.com/evilmartians/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('7bd859c278d99af8e3ade9b5421e1a0d3e6faf8af8978f6280b204f0f9e6a073')

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