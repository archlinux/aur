# Maintainer: Po-An,Yang(Antonio) <yanganto@gmail.com>
# Co-Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=dayanuyim

_pkgname=GisEditor
pkgname=${_pkgname,,}
pkgver=0.27
pkgrel=2
pkgdesc='A gis editor for .gpx .gdb and download maps source'
arch=('any')
url='https://github.com/dayanuyim/GisEditor'
license=()
depends=('gpsbabel' 'python-pmw' 'python-pillow' 'python-numpy' 'python-cycler' 'python-matplotlib' 'python-olefile' 'python-pyparsing' 'python-dateutil' 'python-pytz' 'python-six' 'python-certifi' 'ttf-droid' 'python-image' 'python-timezonefinder')
optdepends=('ttf-arphic-ukai' )
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c5ae9f85b6c668dbe2a493353cd274df5117a06adaa9fbd88eb3cfcaaeb41ad9')

prepare() {
  cd ${_pkgname}-${pkgver}

  cat << EOF > $pkgname
#!/bin/sh
python /opt/$pkgname/main.py
EOF
}

package() {
  cd ${_pkgname}-${pkgver}

  install -dm755 $pkgdir/opt/$pkgname/conf
  install -dm755 $pkgdir/opt/$pkgname/data
  install -dm755 $pkgdir/opt/$pkgname/doc/pic
  install -dm755 $pkgdir/opt/$pkgname/icon
  install -dm755 $pkgdir/opt/$pkgname/mapcache/Bakcup
  install -dm755 $pkgdir/opt/$pkgname/script
  install -dm755 $pkgdir/opt/$pkgname/src

  install -Dm644 conf/*.conf $pkgdir/opt/$pkgname/conf
  install -Dm644 data/* $pkgdir/opt/$pkgname/data
  install -Dm644 doc/pic/* $pkgdir/opt/$pkgname/doc/pic
  install -Dm644 icon/* $pkgdir/opt/$pkgname/icon
  install -Dm644 mapcache/*.xml $pkgdir/opt/$pkgname/mapcache
  install -Dm644 mapcache/Bakcup/*.xml $pkgdir/opt/$pkgname/mapcache/Bakcup
  install -Dm644 script/*.py $pkgdir/opt/$pkgname/script
  install -Dm644 src/*.py $pkgdir/opt/$pkgname/src
  install -Dm644 main.py $pkgdir/opt/$pkgname/main.py

  install -Dm755 $pkgname ${pkgdir}/usr/bin/$pkgname
  install -Dm644 data/giseditor.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
  install -Dm644 install/linux/giseditor.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
