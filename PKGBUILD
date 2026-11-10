# Maintainer:   Corey Berla <corey@berla.me>
# Contributor:  M.Reynolds <blackboxnetworkproject@gmail.com>
# Contributor:  Vlad M. <vlad@archlinux.net>
# Contributor:  Christophe Gueret <christophe.gueret@gmail.com>
# Contributor:  josephgbr <rafael.f.f1@gmail.com>
# Contributor:  cmorlok <christianmorlok@web.de>
# Contributor:  fazibear <fazibear@gmail.com>
# Contributor:  neuromante <lorenzo.nizzi.grifi@gmail.com>
# Contributor:  Gordin <9ordin @t gmail.com>

pkgname=nautilus-dropbox
pkgdesc="Dropbox Nautilus Extension"
pkgver=2026.09.28
pkgrel=1
arch=(x86_64)
url="https://www.dropbox.com/"
license=('CC-BY-ND-3.0 AND GPL-3.0-or-later')
depends=(nautilus libnautilus-extension dropbox)
makedepends=(python python-docutils python-gobject gnome-common)
options=('!libtool' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dropbox/nautilus-dropbox/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('6063f6c650dede6a230cdf46bcf9207fecb2a6d2d7e5674b6c8e4dd16923bb7509028941562d5fb790d9102f9e93bcc6fdd29da7620d779397ed32a2b4bc6548')

build() {
    cd nautilus-dropbox-${pkgver}
    ./autogen.sh
    make
}

package() {
    cd nautilus-dropbox-${pkgver}
    make DESTDIR="$pkgdir" install

    # install the common license
    install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"

    # remove executables and depend on 'dropbox' package
    rm "$pkgdir/usr/bin/dropbox"
    rm "$pkgdir/usr/share/applications/dropbox.desktop"
    rm "$pkgdir/usr/share/man/man1/dropbox.1"
}

