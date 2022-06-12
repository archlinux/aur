# Maintainer: Axel Navarro <navarroaxel gmail>
pkgname=corepack
pkgver=0.11.0
pkgrel=1
pkgdesc="Zero-runtime-dependency package acting as bridge between Node projects and their package managers."
arch=('any')
url="https://github.com/nodejs/$pkgname"
license=('MIT')
depends=('nodejs')
makedepends=('yarn')
provides=('corepack')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('efcea921c603bb53645b65e9ea55bcd093828bf14b3b4687699db650447dcc69')

prepare

build() {
  cd "$srcdir/$pkgname-$pkgver"
  yarn install
  yarn build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/usr/lib/$pkgname"
  cp -a dist/** "$pkgdir/usr/lib/$pkgname/"
  chmod +x "${pkgdir}/usr/lib/$pkgname/$pkgname.js"

  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -d "$pkgdir/usr/bin"
  ln -s "/usr/lib/$pkgname/$pkgname.js" "$pkgdir/usr/bin/$pkgname"
}
