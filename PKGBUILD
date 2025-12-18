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
pkgver=2025.05.20
pkgrel=1
arch=(x86_64)
url="https://www.dropbox.com/"
license=('custom:CC-BY-ND-3' 'GPL')
depends=(nautilus libnautilus-extension dropbox)
makedepends=(python python-docutils python-gobject gnome-common)
options=('!libtool' '!emptydirs')
source=('https://github.com/dropbox/nautilus-dropbox/archive/refs/tags/v2025.05.20.tar.gz')
sha512sums=('057fc46885c817a627cafa8a67f324be294ee858bdcf142b9e8fce9533bd3d8644e25b73316a9c2709e77967eff4d936e4bd2a55cecfe44604ba27d5b5c64613')

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

