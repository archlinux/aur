
# Maintainer: Haron Prime (Haron_Prime) <haron.prime@gmx.com>
pkgname=gis-weather-git
pkgver=0.8.0.12
pkgrel=3
pkgdesc="Customizable weather widget"
arch=('i686' 'x86_64')
url="https://github.com/RingOV/gis-weather"
license=('GPLv3')
groups=()
depends=('gtk3' 'python' 'python-gobject' 'python-cairo')
makedepends=('git')
provides=()
conflicts=('gis-weather')

source=("${pkgname}::git://github.com/RingOV/gis-weather")
md5sums=('SKIP')

package() {
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/gis-weather
  mkdir -p ${pkgdir}/usr/share/applications
  cp -R $srcdir/$pkgname/. $pkgdir/usr/share/gis-weather
  rm -fr $pkgdir/usr/share/gis-weather/.git
  chmod -R 777 $pkgdir/usr/share/gis-weather 
  echo "exec python3 /usr/share/gis-weather/gis-weather.py $*" > ${pkgdir}/usr/bin/gis-weather
  chmod 755 ${pkgdir}/usr/bin/gis-weather
  echo "[Desktop Entry]
Name=Gis Weather
Comment=Weather widget
Categories=GNOME;Utility;
Exec=/usr/bin/gis-weather
Icon=/usr/share/gis-weather/icon.png
Terminal=false
Type=Application" > $pkgdir/usr/share/applications/gis-weather.desktop
  #install -Dm644 "gis-weather.desktop" "$pkgdir/usr/share/applications/gis-weather.desktop"
  #install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
