# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch
pkgver=1.4.7
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('e9d010029fc136514be2050d291b0928c1f96f561e5bcd7e5af9c6e09d3e6486')

build() {
  cd "terraform-switcher-$pkgver"
  go build \
    -trimpath \
    -ldflags "-s -w -X main.version=v$pkgver" \
    -o "$pkgname" .
}

package() {
  cd "terraform-switcher-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
