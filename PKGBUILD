# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=1.0.10
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('a35a0ff89e692545defadb4e6f8ef845a72b271d84802cc7745675a25c19fa0b')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-X github.com/guumaster/hostctl/pkg/cmd.version=$pkgver -s -w -extldflags $LDFLAGS" \
    -o $pkgname cmd/hostctl/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
