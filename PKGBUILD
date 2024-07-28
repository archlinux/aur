# Maintainer: Benjamin Voisin <benjamin.voisin@ens-rennes.fr>
pkgname=sunpaper
pkgver=v2.0
pkgrel=1
pkgdesc="An utility to change wallpaper based on local sunrise and sunset times."
arch=('x86_64')
url="https://github.com/hexive/$pkgname"
license=('Apache')
depends=('sunwait' 'wallutils')
makedepends=('git')
optdepends=('swww' 'pywall' 'python-pywal')
_tag=1a987b75996a349a67bce41cb94ecca62a0ec0c4 #git rev-parse $pkgver
source=( "$pkgname-$pkgver::git+$url.git#tag=$_tag")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # As we copy the defaults wallpapers into /ush/share/sunpaper, the default
  # path to found them should be this one
  sed -i 's|wallpaperPath=".*"|wallpaperPath="/usr/share/sunpaper/images/Corporate-Synergy"|' AUR/config
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/sunpaper
  mkdir -p $pkgdir/usr/bin
  cp sunpaper.sh $pkgdir/usr/bin/sunpaper
  cp AUR/config $pkgdir/usr/share/sunpaper/
  cp -r images $pkgdir/usr/share/sunpaper/

}
