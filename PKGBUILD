# Maintainer: PiterDeVries <https://aur.archlinux.org/account/PiterDeVries>

pkgname=parmen
pkgver=2.98f
pkgrel=1
pkgdesc='2D classic and 3D Star Trek Tridimensional Chess'
url='http://www.parmen.com/'
license=('custom')
depends=('bash' 'glu' 'freeglut' 'sdl2')
arch=('x86_64')
source=("${pkgname}-${pkgver}.zip::${url}/${pkgname}x.zip"
        "3dguide.doc::${url}/3dguide.doc")
sha256sums=('d98c1d220aa967df2ecc0b0d33fe8cf3f4257952c12fb398164b2800071078bf'
            '70bdac013f1662640625df11372698981ad7c68b08526a3290c524870370737c')

package() {
  #create directories in the destination:
  install -d -m755 $pkgdir/usr
  install -d -m755 $pkgdir/usr/bin
  install -d -m755 $pkgdir/usr/lib
  install -d -m755 $pkgdir/usr/share
  install -d -m755 $pkgdir/usr/lib/${pkgname}
  install -d -m755 $pkgdir/usr/share/${pkgname}
  
  #copy files from the binary (src) to the destination:
  cd "$srcdir/${pkgname}"  
  cp ./${pkgname} $pkgdir/usr/lib/${pkgname}
  chmod 755 $pkgdir/usr/lib/${pkgname}/${pkgname}
  cp -r ./pieces $pkgdir/usr/lib/${pkgname}
  cp "$srcdir/3dguide.doc" $pkgdir/usr/share/${pkgname}
  
  #as a final step, construct an executable script in /usr/bin
  touch $pkgdir/usr/bin/${pkgname}
  chmod 755 $pkgdir/usr/bin/${pkgname}
  echo "#!/bin/sh" >> $pkgdir/usr/bin/${pkgname}
  echo "cd /usr/lib/parmen" >> $pkgdir/usr/bin/${pkgname}
  echo 'exec ./parmen "$@"' >> $pkgdir/usr/bin/${pkgname}
}
