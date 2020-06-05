# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=1.0.11
pkgrel=2
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('2e39eb64306168593248ea9b2505d22caca9fac1eff3c1e3bf1f0f966df36a8a')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X github.com/guumaster/hostctl/pkg/cmd.version=$pkgver -s -w -extldflags $LDFLAGS" \
    -o $pkgname cmd/hostctl/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
