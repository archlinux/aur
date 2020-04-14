# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=hostctl
pkgver=1.0.5
pkgrel=1
pkgdesc='Command-line tool to manage your hosts file'
arch=('x86_64')
url='https://github.com/guumaster/hostctl'
license=('MIT')
conflicts=("${pkgname}-bin")
makedepends=('go-pie')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('1f03b310640124a5009615f49f094b662caf8496838819b29f2c4eed28cebbb2')

build() {
  cd $pkgname-$pkgver
  go build \
    -trimpath \
    -ldflags "-X github.com/guumaster/hostctl/cmd.version=$pkgver -extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname-$pkgver
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
