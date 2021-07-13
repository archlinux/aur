# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=1.1.0
pkgrel=3
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('7d184f5189b98657bc5be3b4b34d3f908794f545e4648631d365ae9544155a77')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X github.com/guumaster/hostctl/cmd/hostctl/actions.version=$pkgver -s -w -extldflags $LDFLAGS" \
    -o $pkgname cmd/hostctl/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
