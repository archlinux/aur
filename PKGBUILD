# Maintainer: jose <jose1711 [at] gmail (dot) com>

pkgname=py3dg200
pkgver=1.6
pkgrel=2
pkgdesc="manager for DG200 GPS datalogger allowing track download and device configuration"
arch=('i686' 'x86_64')
url="http://coillet.eu/Site/Dev.php?lang=en"
depends=('python-gobject' 'python-pyserial')
license=('GPL3')
source=("http://coillet.eu/Site/Documents/PyDG200/Py3DG200-${pkgver}.tar.bz2" "py3dg200.desktop" "gtk3.patch")
md5sums=('b72d42e63a04e28932aa43a129dbcfc8'
         'c9f370080a1af0074817b20452831e39')

prepare() {
  cd $srcdir/Py3DG200-${pkgver}
  patch -p0 -i "$srcdir/gtk3.patch"
}

package() {
  cd $srcdir/Py3DG200-${pkgver}
  install -Dm644 Gui.ui $pkgdir/usr/share/Py3DG200/Gui.ui
  install -Dm644 README $pkgdir/usr/share/Py3DG200/README
  install -Dm755 Py3DG200.py $pkgdir/usr/share/Py3DG200/Py3DG200.py
  mkdir -p ${pkgdir}/usr/bin
  cat > ${pkgdir}/usr/bin/Py3DG200 <<HERE
#!/bin/bash
cd /usr/share/Py3DG200
./Py3DG200.py "\$@"
HERE
  chmod 0755 ${pkgdir}/usr/bin/Py3DG200
  install -D -m644 $srcdir/${pkgname}.desktop $pkgdir/usr/share/applications/${pkgname}.desktop
}
