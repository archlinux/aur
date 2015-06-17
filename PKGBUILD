# Maintainer: M0Rf30

pkgname='python2-desktopleapr'
pkgver=2.a7a0789
pkgrel=1
pkgdesc="A Leap Motion Desktop Navigator for Linux"
url="https://github.com/hsocasnavarro/DesktopLeapr"
arch=('any')
license=('GPL2')
depends=('python2' 'python2-xlib' 'leap-motion-sdk')
optdepends=('xdotool')
source=('git+https://github.com/hsocasnavarro/DesktopLeapr.git'
	'desktopleapr')

package() {
  cd DesktopLeapr
  
  mkdir -p $pkgdir/opt/desktopleapr
  cp {desktopleapr.py,README} $pkgdir/opt/desktopleapr
  ln -sr /usr/lib/Leap/libLeap.so $pkgdir/opt/desktopleapr
  ln -sr /usr/lib/Leap/Leap.py $pkgdir/opt/desktopleapr/
  ln -sr /usr/lib/Leap/LeapPython.so $pkgdir/opt/desktopleapr/
  install -Dm644 ../desktopleapr $pkgdir/usr/bin/desktopleapr
  chmod +x $pkgdir/usr/bin/desktopleapr
  cd ${pkgdir}  
  python2 -m compileall .
}

pkgver() {
  cd DesktopLeapr
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

md5sums=('SKIP'
         '2b5e6bd36251bfb6aa528f5b85a0b056')
