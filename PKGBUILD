# Maintainer: David Scholl <djscholl at gmail dot com>

pkgname=sofastats
pkgver=1.4.6
pkgrel=2
pkgdesc="Statistics Open For All"
arch=('any')
url="http://www.sofastatistics.com/"
license=('custom')
depends=('python2-xlwt' 'bash-completion' 'desktop-file-utils' 'ghostscript' 'hicolor-icon-theme' 'imagemagick' 'mysql-python' 'pdftk-bin' 'python2' 'pywebkitgtk' 'wkhtmltopdf' 'wxpython' 'python2-matplotlib' 'python2-numpy' 'python2-psycopg2' 'python2-requests' 'wxpython2.8')
makedepends=('python2-distribute')
replaces=('sofa')
source=("http://heanet.dl.sourceforge.net/project/sofastatistics/sofastatistics/$pkgver/$pkgname-$pkgver.tar.gz" "setup.py" "sofastats.desktop")
md5sums=('c39880daebead5247b78b6550cb4e2c4'
         '0d532fe665c66d8a2ff001db173bb84e'
         'f267ddd0371a29a3466bec780eda3fd6')

build() {
  cd $srcdir/$pkgname-$pkgver
  cp $srcdir/setup.py ./ 
  touch sofa_main/__init__.py
  python2 setup.py build 
}
package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir
  echo "#!/bin/bash" > sofastats
  echo "/usr/bin/env python2 "\
  "/usr/lib/python$(pacman -Q python2 | colrm 1 8 | colrm 4)/site-packages/sofastats/start.py "\
  >> sofastats
  chmod a+x sofastats
  install -D sofastats $pkgdir/usr/bin/sofastats 
  install -D copyright $pkgdir/usr/share/licenses/$pkgname/copyright
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

