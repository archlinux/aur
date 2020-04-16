# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=1.0.9
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('54c9a9d80bc128165713706d520f9962dd3e37e268fd73ae0adae400b89c2ab4')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-X github.com/guumaster/hostctl/pkg/cmd/cmd.version=$pkgver -s -w -extldflags $LDFLAGS" \
    -o $pkgname cmd/hostctl/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
