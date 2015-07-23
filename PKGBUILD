# Maintainer: Felix Yan <felixonmars@gmail.com>

_basename=xdotoolgui
pkgname=xdotool-gui
pkgver=1.2
_pkgrel=1
pkgrel=2
pkgdesc="GUI for command-line X11 automation tool"
arch=('any')
url="http://sourceforge.net/projects/xdotool-gui/"
license=('GPL')
depends=('xdotool' 'python2' 'pygtk')
source=(
  "http://downloads.sourceforge.net/project/${pkgname}/${_basename}_${pkgver}-${_pkgrel}.tar.gz"
  xdotoolgui.desktop
)

build() {
  cd "$srcdir/$_basename-$pkgver"

  sed -i -re "1s/python2?/python2/" *.py
  sed -i -re "44s|sys.path\[0\]|'/usr/share/xdotool-gui'|" xdotoolgui.py
}

package() {
  cd "$srcdir/$_basename-$pkgver"
  
  install -Dm755 xdotoolgui.py "$pkgdir/usr/bin/xdotool-gui"
  install -Dm644 xdotoolgui.glade "$pkgdir/usr/share/$pkgname/xdotoolgui.glade"
  install -Dm644 "$srcdir/xdotoolgui.desktop" "$pkgdir/usr/share/applications/xdotoolgui.desktop"
  install -Dm644 runxdotool.py "$pkgdir/usr/lib/python2.7/site-packages/runxdotool.py"
  install -Dm644 data/xdotoolgui.gif "$pkgdir/usr/share/$pkgname/xdotoolgui.gif"
}

# vim:set ts=2 sw=2 et:
md5sums=('1cde9e5d2d773decc7d92e0f0d2b25f3'
         'c8249f6de5d7dc64f1bc1434790bd1a8')
