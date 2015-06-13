# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=pythoncad
_pkgname=PythonCAD
pkgver=r38.alpha4
pkgrel=1
pkgdesc="Aka Pycad.  A simple and scriptable 2D cad."
arch=('any')
url="http://pythoncad.sourceforge.net/dokuwiki/doku.php"
license=('GPL2')
depends=('python2-pyqt' 'python2-sympy')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/R38%20PyQT/Pre%20Alfa/PythonCAD_Alfa_04.zip)
md5sums=('e988cfc2eeeb8daa14822e36bed804c2')

package() {
  cd "$srcdir/$_pkgname"

  find ./ -type f -executable -exec chmod -x '{}' \;
  find ./ -type f -name '*.py' | xargs -n 1 sed -i 's|/usr/bin/env python$|/usr/bin/env python2|'
  find ./ -name '*.pyc' -delete

  install -d "$pkgdir/opt/$pkgname"
  cp -r ./ "$pkgdir/opt/$pkgname/"

  # launch script
  install -d "$pkgdir/usr/bin"
  touch "$pkgdir/usr/bin/pycad"
  echo -e "#!/bin/sh\ncd /opt/$pkgname/\nexec python2 pythoncad_qt.py" > "$pkgdir/usr/bin/pycad"
  chmod +x "$pkgdir/usr/bin/pycad"
}


