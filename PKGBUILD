# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=passwall-desktop
_pkgname=passwall
pkgdesc="Desktop client of the PassWall platform"
pkgver=0.1.3
pkgrel=1
arch=('x86_64')
url="https://github.com/passwall/passwall-desktop"
license=('unknown')
depends=('git')
makedepends=('yarn' 'npm')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0af5a51e336cf10c07f2d8d351c92d4c435dabbfb698ea49fbf7186e959af397')

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
