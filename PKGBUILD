# Maintainer: lucy <lucy@luz.lu>

pkgname=bdf-tewi-git
_gitname=tewi-font
pkgver=0.290.9841a18
pkgrel=1
pkgdesc='Bitmap font'
arch=('any')
url="https://github.com/lucy/tewi-font"
license=('MIT')
depends=('xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('git python make')
install="$pkgname.install"
source=('git+https://github.com/lucy/tewi-font.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_gitname"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
  cd "$_gitname"
  make var
  make all
  install -T -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -d -m755 "$pkgdir/usr/share/fonts/misc/"
  install -m644 -t "$pkgdir/usr/share/fonts/misc/" out/*.pcf.gz
}
