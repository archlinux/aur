# Contributor : speps <speps at aur dot archlinux dot org>
# Contributor: Chris Baker <baker.chris.3@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=editra
pkgver=0.7.20
pkgrel=1
pkgdesc="Multi-platform text editor with features that aid in code development"
arch=('any')
url="http://$pkgname.org/"
license=('custom:wxWindows')
depends=('python2-wxpython3' 'python2-distribute' 'desktop-file-utils')
source=("${url}uploads/src/${pkgname//e/E}-$pkgver.tar.gz"
        "$pkgname.desktop")
md5sums=('a52c6b3d703f98e0390aa7b44f991616'
         '43efe17af89dc701a0a3add517fa5cb8')
         
build() {
  cd ${pkgname//e/E}-$pkgver
  python2 setup.py build
}

package() {
  cd ${pkgname//e/E}-$pkgver

  python2 setup.py install --root="$pkgdir/"

  # desktop and pixmaps
  install -Dm644 ../${source[1]} "$pkgdir/usr/share/applications/${source[1]}"
  install -Dm644 pixmaps/$pkgname.png "$pkgdir/usr/share/pixmaps/$pkgname.png"

  # license
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

  # python2 fixes
  sed -i "s|\(^\#\!.*python\).*|\12|" `grep -rl "\#\!.*python" "$pkgdir"`
}
