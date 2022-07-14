# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=ttf-font-logos
pkgver=1.0.1
pkgrel=2
pkgdesc="An icon font providing popular Linux distro logos."
arch=(any)
replaces=('ttf-font-linux')
url="https://github.com/lukas-w/font-logos"
license=('Unlicense')
makedepends=('wkhtmltopdf' 'yarn' 'jq' 'fontforge')
depends=('fontconfig')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4f476528c5a2b2e40e156527af7b711eb92de73f4ee961c90ea60e5fa41f32ea')

build() {
  cd font-logos-$pkgver/
  yarn install
  make
}

package() {
  cd font-logos-$pkgver/
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 assets/*.ttf "$pkgdir/usr/share/fonts/TTF"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
