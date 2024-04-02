# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=ttf-font-logos
pkgver=1.2.0
pkgrel=1
pkgdesc="An icon font providing popular Linux distro logos."
arch=(any)
replaces=('ttf-font-linux')
url="https://github.com/lukas-w/font-logos"
license=('Unlicense')
makedepends=('yarn' 'jq' 'fontforge')
depends=('fontconfig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a780555c56133a06917862c11ce1c88c509ee04618ab25ec79f73fd4cde82532')

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
