# Maintainer: Nicolas Avrutin <nicolasavru@gmail.com>

pkgname=winconn
pkgver=0.2.14
pkgrel=4
pkgdesc="RemoteApp connection manager"
arch=(any)
url="http://stanev.org/winconn/"
license=('GPL3')
depends=('python2' 'gtk3' 'gobject-introspection' 'libappindicator-gtk3'
'yelp' 'freerdp' 'xdg-utils' 'python2-dbus' 'python2-gobject')
makedepends=('python2-distutils-extra')
source=('https://launchpad.net/~realender/+archive/winconn/+files/winconn_0.2.14-1.tar.gz')
sha256sums=('0f7dc9e6d10ce89b0d7fc1cf05525d610bec6991bfc5ce39d47c08d6b485c987')

prepare() {
    cd "$srcdir/$pkgname"
    find . -name '*.py' -exec sed -i 
's|#!/usr/bin/python$|#!/usr/bin/env python2|' {} \;
    find . -name '*.py' -exec sed -i 's|#!/usr/bin/env 
python$|#!/usr/bin/env python2|' {} \;
}

package() {
    cd "$srcdir/$pkgname"
    python2 setup.py install --root="$pkgdir/"  --optimize=1 
--no-compile

    # remove $pkgdir/etc/apport/crashdb.conf.d/winconn-crashdb.conf
    # this is the only file created under /etc and Apport is 
Ubuntu-specific
    rm -rf "$pkgdir/etc"
}
