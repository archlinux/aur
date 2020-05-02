# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=pilgo
_binname=plg
pkgver=0.5.0
pkgrel=1
pkgdesc='Configuration-based symlink farm manager CLI and framework'
arch=('x86_64')
url='https://github.com/gbrlsnchs/pilgo'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('4fefbc30e8d2568c04687613a611ac9f9864028add28b82b3912b9e267c20635')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-X ${url#https://}/cmd/internal.version=$pkgver -s -w -extldflags $LDFLAGS" \
    -o $_binname "${url#https://}/cmd/plg"
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $_binname "$pkgdir"/usr/bin/$_binname
}
