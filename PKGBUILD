# Maintainer: Sebastian Kunze <mail at sebastiankunze dot de>

pkgname=tfswitch
pkgver=1.5.1
pkgrel=1
pkgdesc='A command line tool to switch between different versions of terraform.'
arch=('x86_64')
url='https://github.com/warrensbox/terraform-switcher'
license=('MIT')
makedepends=('go')
source=("$url/archive/v$pkgver.tar.gz")
sha256sums=('f40b7846b13ded6b1b533451021dbcc3f9d8bd5790969c5fd515ff39bf20d387')

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
