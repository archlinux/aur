# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=pyroom
pkgver=0.4.1
pkgrel=2
pkgdesc='A distraction-free text editor'
arch=(any)
url='http://pyroom.org/'
license=(GPL3)
depends=(python2 python2-pyxdg pygtk) # gettext is in base
optdepends=('python2-gconf: to use GNOME default fonts')
source=("http://launchpad.net/$pkgname/0.4/0.4.1/+download/$pkgname-$pkgver.tar.gz")
md5sums=('35e6dfb611b2732471a78f88465ebf7f')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # correct the python 2 path
    sed -i 's:^#!/usr/bin/env python:#!/usr/bin/env python2:' pyroom

    # the distutils script includes translations, icons, .desktop, etc.
    python2 setup.py install --root="$pkgdir" --optimize=1

    # but not documentation
    mandir="$pkgdir"/usr/share/man/man1
    install -d "$mandir"
    gzip < pyroom.1 > "$mandir"/pyroom.1.gz
    docdir="$pkgdir"/usr/share/doc/pyroom
    install -d "$docdir"
    install -m644 README AUTHORS CHANGELOG "$docdir"

}
