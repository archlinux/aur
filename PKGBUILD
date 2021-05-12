# Maintainer: Pippo Peppo <abc@gmx.ch>
# Contributor: Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.2.1_553
pkgrel=1
pkgdesc="Synology Note Station Client connects you with Note Station on your Synology NAS. You can manage all the notes/to-do list offline, right from your local computer."
arch=('i686' 'x86_64')
url="https://www.synology.com/support/download/"
license=('(C) Synology: Proprietary')
depends=('gtk3' 'nss')
options=('emptydirs')
# https://www.synology.com/en-us/support/download/DS216
if [[ ${CARCH} == "i686" ]]; then
    source=("https://global.download.synology.com/download/Utility/NoteStationClient/${pkgver/_/-}/Ubuntu/i686/synology-note-station-client-${pkgver/_/-}-linux-x86.deb")
    md5sums=('cbe057ee637083f1da7bfdb9b901061d')
elif [[ ${CARCH} == "x86_64" ]]; then
    source=("https://global.download.synology.com/download/Utility/NoteStationClient/${pkgver/_/-}/Ubuntu/x86_64/synology-note-station-client-${pkgver/_/-}-linux-x64.deb")
    md5sums=('51a48b2e8a5f11f8df9a68960482998f')
fi

prepare() {
    cd "$srcdir"
    tar -xJf "$srcdir"/data.tar.xz
}

package() {
    cp -rp $srcdir/opt $pkgdir/
    cp -rp $srcdir/usr $pkgdir/
    mkdir $pkgdir/usr/bin/
    ln -s $srcdir/opt/synology-note-station/synology-note-station $pkgdir/usr/bin/
}
