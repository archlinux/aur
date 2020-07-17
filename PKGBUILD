# Contributor : speps <speps at aur dot archlinux dot org>
# Contributor: Chris Baker <baker.chris.3@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=editra
pkgver=0.7.20
pkgrel=4
pkgdesc="Multi-platform text editor with features that aid in code development"
arch=('any')
url="https://pypi.org/project/Editra/"
license=('custom:wxWindows')
depends=('python2-wxpython3' 'python2-distribute' 'desktop-file-utils')
source=(https://files.pythonhosted.org/packages/8d/35/5b9367660329e98127a1f38ba28fc3df8fa32130bd4110f30fe394e29c7a/Editra-0.7.20.tar.gz
        "$pkgname.desktop")
sha256sums=('ed515bca58d87d9a2b3085f322a9fe7c6d1407a3b05db1434f80ea8f7e42ccc0'
            '0b3fefa26a41d28acf4c5c72fc6e8b744504b5a49f64fe01a03580a08389d5af')
         
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
