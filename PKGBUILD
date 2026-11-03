# Maintainer: Stefan Schüller <sschueller@techdroid.com>
# Contributor: Pippo Peppo <abc@gmx.ch>, Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.2.6_813
pkgrel=1
pkgdesc="Synology Note Station Client connects you with Note Station on your Synology NAS. You can manage all the notes/to-do list offline, right from your local computer."
arch=('i686' 'x86_64')
url="https://www.synology.com/support/download/"
license=('(C) Synology: Proprietary')
depends=('gtk3' 'nss')
options=('emptydirs')
# https://www.synology.com/en-us/support/download/DS216
# https://global.synologydownload.com/download/Utility/NoteStationClient/2.2.6-813/Ubuntu/x86_64/synology-note-station-client-2.2.6-813-linux-x64.deb
if [[ ${CARCH} == "i686" ]]; then
    source=("https://global.download.synology.com/download/Utility/NoteStationClient/${pkgver/_/-}/Ubuntu/i686/synology-note-station-client-${pkgver/_/-}-linux-x86.deb")
    md5sums=('b533502e0155ed9b1b1568ef68c1a7f0')
elif [[ ${CARCH} == "x86_64" ]]; then
    source=("https://global.download.synology.com/download/Utility/NoteStationClient/${pkgver/_/-}/Ubuntu/x86_64/synology-note-station-client-${pkgver/_/-}-linux-x64.deb")
    md5sums=('5924613dd3c37b0cd7414aad689cc650')
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
