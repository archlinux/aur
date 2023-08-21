# Maintainer: Stefan Schüller <sschueller@techdroid.com>
# Contributor: Pippo Peppo <abc@gmx.ch>, Sebastian Weisgerber <sweisgerber.dev@gmail.com>
pkgname=synology-note-station
pkgver=2.2.3_653
pkgrel=1
pkgdesc="Synology Note Station Client connects you with Note Station on your Synology NAS. You can manage all the notes/to-do list offline, right from your local computer."
arch=('i686' 'x86_64')
url="https://www.synology.com/support/download/"
license=('(C) Synology: Proprietary')
depends=('gtk3' 'nss')
options=('emptydirs')
# https://www.synology.com/en-us/support/download/DS216
# https://global.synologydownload.com/download/Utility/NoteStationClient/2.2.3-653/Ubuntu/x86_64/synology-note-station-client-2.2.3-653-linux-x64.deb
if [[ ${CARCH} == "i686" ]]; then
    source=("https://global.download.synology.com/download/Utility/NoteStationClient/${pkgver/_/-}/Ubuntu/i686/synology-note-station-client-${pkgver/_/-}-linux-x86.deb")
    md5sums=('41761cb6f2a0aeafcf8a2dc59b4209d8')
elif [[ ${CARCH} == "x86_64" ]]; then
    source=("https://global.download.synology.com/download/Utility/NoteStationClient/${pkgver/_/-}/Ubuntu/x86_64/synology-note-station-client-${pkgver/_/-}-linux-x64.deb")
    md5sums=('abed9e1a0cb86bf8513789d69d8440c5')
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
