# Maintainer: Trashlord <dornenreich666 at gmail dot com>
# Maintainer notes:
# The package now works exclusively with Python 3. Python 2 is no longer supported.
# Special thanks to Ailin Nemui for the help with building it against 1.3.2-an.

pkgname=irssi-python
pkgver=test5
pkgrel=4
pkgdesc="Provides Python scripting support for Irssi"
url="http://irssi.org/"
arch=('x86_64')
install='irssi-python.install'
makedepends=('git')
depends=('python' 'irssi')
license=('GPL2')

build() {     
    # Get irssi-python with git
    git clone https://github.com/irssi-import/irssi-python
    # Generate configure file
    cd "irssi-python"
    autoreconf -ivf -I.
    # Build
    ./configure --prefix=/usr
    make -C src constants
    make
    libtool --finish /usr/lib/irssi/modules
}

package() {
    # libpython.so will be installed in /usr/lib/irssi/modules
    # Scripts will be installed in /usr/share/irssi/scripts
    # Documentation will be installed in /usr/share/doc/irssi
    cd "$srcdir/irssi-python/"
    mkdir -p "$pkgdir/usr/share/doc/irssi"
    install -m644 "docs/irssi-python.html" "$pkgdir/usr/share/doc/irssi"
    make DESTDIR="$pkgdir" install
}
