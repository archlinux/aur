# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=pysolo
pkgver=1.1
pkgrel=3
pkgdesc="A software for sleep analysis in Drosophila"
arch=('i686' 'x86_64')
depends=('python2' 'wxpython' 'python2-scipy' 'python2-numpy' 'python2-matplotlib')
url="http://www.pysolo.net"
license=('GPL')

source=(http://ppa.pysolo.net/pool/main/${pkgname}_${pkgver}.orig.tar.gz ${pkgname}.desktop)
md5sums=('0e31d9962d2e255a4c15467aee0d1cc1' 'afc264d5b12f73a4238c5a9c4e1cfddf')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/env python/env python2/' pysolo.py pysolo_anal.py pysolo_db.py
  sed -i 's/debian=False/debian=True/' pysolo_path.py
}

package() {
  install -d $pkgdir/usr/share/applications
  install -d $pkgdir/opt/pysolo
  
  cd $srcdir/$pkgname-$pkgver
  #cp -r * $pkgdir/opt/pysolo/
  cp -dr --preserve=mode,timestamp * $pkgdir/opt/pysolo/
  chmod 755 $pkgdir/opt/pysolo/img

  cp $srcdir/*.desktop $pkgdir/usr/share/applications/
}

