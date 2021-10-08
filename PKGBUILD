# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=corepack
pkgver=0.10.0
pkgrel=1
pkgdesc="Zero-runtime-dependency package acting as bridge between Node projects and their package managers."
arch=('any')
url="https://github.com/nodejs/$pkgname"
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
provides=('corepack')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgname/$pkgver.tar.gz)
sha256sums=('a3882e10f5382525b8d8e1e243d55a1c224c7c5cf7d6f4c2c1d997073b7e7f19')

build() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  yarn build
}

package() {
  cd "$srcdir/$pkgname-$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a dist/** "$pkgdir/usr/lib/$pkgname/"
  chmod +x "${pkgdir}/usr/lib/$pkgname/$pkgname.js"

  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
}
