# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>
pkgname=sunpaper
pkgver=2.1
pkgrel=1
pkgdesc="An utility to change wallpaper based on local sunrise and sunset times."
arch=('x86_64')
url="https://github.com/hexive/$pkgname"
license=('Apache')
depends=('sunwait' 'wallutils')
optdepends=('swww' 'pywall' 'python-pywal')
source=("$pkgname-v$pkgver.tar.gz::https://github.com/hexive/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('33f9568b40bef4ff10f9adf54f48829c979e4251a25424000171f4f0711f1043')

prepare() {
  cd "$pkgname-$pkgver"
  # As we copy the defaults wallpapers into /ush/share/sunpaper, the default
  # path to found them should be this one
  sed -i 's|wallpaperPath=".*"|wallpaperPath="/usr/share/sunpaper/images/Corporate-Synergy"|' AUR/config
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/sunpaper
  mkdir -p $pkgdir/usr/bin
  cp sunpaper.sh $pkgdir/usr/bin/sunpaper
  cp AUR/config $pkgdir/usr/share/sunpaper/
  cp -r images $pkgdir/usr/share/sunpaper/

}
