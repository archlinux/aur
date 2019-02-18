# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  Vlad M. <vlad@archlinux.net>
# Contributor:  Christophe Gueret <christophe.gueret@gmail.com>
# Contributor:  josephgbr <rafael.f.f1@gmail.com>
# Contributor:  cmorlok <christianmorlok@web.de>
# Contributor:  fazibear <fazibear@gmail.com>
# Contributor:  neuromante <lorenzo.nizzi.grifi@gmail.com>
# Contributor:  Gordin <9ordin @t gmail.com>

pkgname=nautilus-dropbox
pkgver=2019.01.31
pkgrel=1
pkgdesc="Dropbox for Linux - Nautilus extension"
arch=('i686' 'x86_64')
url="https://www.dropbox.com/"
license=('custom:CC-BY-ND-3' 'GPL')
depends=('libnotify' 'nautilus' 'dropbox' 'hicolor-icon-theme')
makedepends=('python-docutils' 'python' 'pygtk')
options=('!libtool' '!emptydirs')
source=("https://linux.dropbox.com/packages/$pkgname-$pkgver.tar.bz2")
md5sums=('61a53264bf92b3b96f6a28cd616c68d6')

build() {
    cd "$pkgname-$pkgver"
    # sed -i "s/python/python2/" configure dropbox.in Makefile.in rst2man.py
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    # install the common license
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    # remove executables and depend on 'dropbox' package
    rm "$pkgdir/usr/bin/dropbox"
    rm "$pkgdir/usr/share/applications/dropbox.desktop"
    rm "$pkgdir/usr/share/man/man1/dropbox.1"
}
