# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=1.0.11
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('73b7acb50d5cc022efe3370ab73c48cfd0185ec2eb216d76789dfd1ff6f40649')

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
