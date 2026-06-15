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
pkgver=2026.05.06
pkgrel=1
arch=(x86_64)
url="https://www.dropbox.com/"
license=('CC-BY-ND-3.0 AND GPL-3.0-or-later')
depends=(nautilus libnautilus-extension dropbox)
makedepends=(python python-docutils python-gobject gnome-common)
options=('!libtool' '!emptydirs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dropbox/nautilus-dropbox/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('64c9e02ddacb30ada8ac803a3f888494be91a7d56e83942fc4b0a96b9abc7a39023b689011d782fdcbb64ce481a4fc93ffd2fa1190a9731af2b1f432f25a6f3f')

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

