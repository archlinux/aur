# Contributor : speps <speps at aur dot archlinux dot org>
# Contributor: Chris Baker <baker.chris.3@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=editra
pkgver=0.7.20
pkgrel=2
pkgdesc="Multi-platform text editor with features that aid in code development"
arch=('any')
url="http://$pkgname.org/"
license=('custom:wxWindows')
depends=('python2-wxpython3' 'python2-distribute' 'desktop-file-utils')
source=("${url}uploads/src/${pkgname//e/E}-$pkgver.tar.gz"
        "$pkgname.desktop")
sha256sums=('ed515bca58d87d9a2b3085f322a9fe7c6d1407a3b05db1434f80ea8f7e42ccc0'
            '99e5e2800ea2306b02e4176eaab61963d651f132e0489ec4a9c2eceda0424031')
         
build() {
  cd ${pkgname//e/E}-$pkgver
  python2 setup.py build
}

package() {
  cd ${pkgname//e/E}-$pkgver

  python2 setup.py install --root="$pkgdir/"

  # desktop and pixmaps
  install -Dm644 ../${source[1]} "$pkgdir"/usr/share/applications/${source[1]}
  install -Dm644 pixmaps/$pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png

  # license
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  # python2 fixes
  sed -i "s|\(^\#\!.*python\).*|\12|" `grep -rl "\#\!.*python" "$pkgdir"`
}
