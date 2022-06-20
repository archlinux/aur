# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch
pkgver=0.13.1275
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
makedepends=('go')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('7154778047b1d71d78bbe7ebaf5f36c1884fa6a3159ecfc6fbfb41d0aea8d89d')

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
