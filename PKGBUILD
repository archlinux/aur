# Maintainer: Haron Prime (Haron_Prime) <haron.prime@gmx.com>

pkgname=gis-weather
pkgver=0.8.4.17
pkgrel=1
pkgdesc="Customizable weather widget"
arch=('any')
url="https://github.com/RingOV/gis-weather"
license=('GPL3')
groups=()
depends=('gtk3' 'libappindicator-gtk3' 'python' 'python-cairo' 'python-distro' 'python-gobject')
optdepends=('librsvg')
provides=()
conflicts=('gis-weather-git')

source=(
    "https://github.com/RingOV/${pkgname}/archive/refs/tags/v${pkgver}.zip"
    "gis-weather.desktop"
)
sha256sums=(
    'a50f5604a3ca4ee90181c96adafdfc40e95a8ae542afde8bfb709aeef89134d2'
    'e5bd1f85c730fcf4a5cc2618b2cb3184597443188b12eb2071540468418575e3'
)

package() {
  cd "$srcdir/$pkgname-$pkgver"

  # symlink executable
  mkdir -p "$pkgdir/usr/bin"
  ln -s '/usr/share/gis-weather/gis-weather.py' "$pkgdir/usr/bin/gis-weather"

  # install files
  install -vDm0755 'gis-weather.py' -t "$pkgdir/usr/share/gis-weather"
  install -vDm0644 'icon.png' -t "$pkgdir/usr/share/pixmaps"
  install -vDm0644 "$srcdir/gis-weather.desktop" -t "$pkgdir/usr/share/applications"

  install -vDm0644 {'icon.png','README.md'} -t "$pkgdir/usr/share/gis-weather"

  #install folders
  for _f in 'dialogs' 'i18n' 'po' 'services' 'themes' 'utils' ; do
    cp --reflink=auto -r "$_f" "$pkgdir/usr/share/gis-weather/"
  done
}
