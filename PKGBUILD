# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=ttf-font-logos
pkgver=1.4.0
pkgrel=1
pkgdesc="An icon font providing popular Linux distro logos."
arch=(any)
replaces=('ttf-font-linux')
url="https://github.com/lukas-w/font-logos"
license=('Unlicense')
makedepends=('yarn' 'jq' 'fontforge')
depends=('fontconfig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('39fc8211398d1705a52b4563abc0a83842a05a8b66e922264cf2d51cc3461169')

build() {
  cd font-logos-$pkgver/
  sed -i '/^$(dest)\/readme-header.png/d' Makefile
  sed -i '/^.*wkhtmltoimage/d' Makefile
  yarn install
  make
}

package() {
  cd font-logos-$pkgver/
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 assets/*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
