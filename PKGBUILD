# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch
pkgver=0.12.1092
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
makedepends=('go')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('a99da84c6fe15ec73e920a7a13b8b760a476fd76ad48259a3120c51312844f69')

build() {
  cd "terraform-switcher-$pkgver"
  go build \
    -trimpath \
    -ldflags "-s -w -X main.version=$pkgver" \
    -o "$pkgname" .
}

package() {
  cd "terraform-switcher-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
