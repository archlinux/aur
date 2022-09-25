# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=1.1.3
pkgrel=4
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('eff9f39e7b6ebce10f578492ca5d6c34cdfadfeb05c4e56da22b0be6e7d95899')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-X github.com/guumaster/hostctl/cmd/hostctl/actions.version=$pkgver -linkmode external -extldflags \"${LDFLAGS}\"" \
    -o $pkgname cmd/hostctl/main.go
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
