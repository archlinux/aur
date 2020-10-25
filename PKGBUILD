# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-desktop
_pkgname=passwall
pkgdesc="Desktop client of the PassWall platform"
pkgver=1.0.0
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-desktop"
license=('unknown')
depends=('git')
makedepends=('yarn' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9cc6286130d67ecbef526335c7ea953da6d4cd9b027c3efb1905083a0023569f')

build() {
  cd "$pkgname-$pkgver"
  yarn && yarn run build
}

package() {
  cd "$pkgname-$pkgver"

  # Install resources and binary
  install -dm 755 "$pkgdir/usr/share/$pkgname"
  cp -r build/linux-unpacked/* "$pkgdir/usr/share/$pkgname"
  install -dm 755 "$pkgdir/usr/local/bin"
  ln -s "/usr/share/$pkgname/$_pkgname" "$pkgdir/usr/local/bin/$_pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"

  # Install pixmaps and fonts
  install -dm 755 "$pkgdir/usr/share/pixmaps"
  install -Dm 644 static/img/logo.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm 644 static/img/error-notify.png "$pkgdir/usr/share/pixmaps/error-notify.png"
  cp -r static/fonts/ "$pkgdir/usr/share/"
}
