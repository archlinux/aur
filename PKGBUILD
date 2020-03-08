# Maintainer:   M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  Vlad M. <vlad@archlinux.net>
# Contributor:  Christophe Gueret <christophe.gueret@gmail.com>
# Contributor:  josephgbr <rafael.f.f1@gmail.com>
# Contributor:  cmorlok <christianmorlok@web.de>
# Contributor:  fazibear <fazibear@gmail.com>
# Contributor:  neuromante <lorenzo.nizzi.grifi@gmail.com>
# Contributor:  Gordin <9ordin @t gmail.com>

pkgname=nautilus-dropbox
pkgver=2020.03.04
pkgrel=4
pkgdesc="Dropbox for Linux - Nautilus extension"
arch=('i686' 'x86_64')
url="https://www.dropbox.com/"
license=('custom:CC-BY-ND-3' 'GPL')
depends=('nautilus' 'dropbox' 'libnotify' 'hicolor-icon-theme')
makedepends=('python' 'python-docutils' 'python-gobject' 'gdk-pixbuf2')
options=('!libtool' '!emptydirs')
source=("https://linux.dropbox.com/packages/$pkgname-$pkgver.tar.bz2")
sha256sums=('f3704103e8c646ec48cd9daf9af2183c6b492c59edf93d8768c14861cb404cca')

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
