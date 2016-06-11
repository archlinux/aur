# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgbase=realvnc-vnc
pkgname=('realvnc-vnc-viewer' 'realvnc-vnc-server')
pkgver=5.3.1
pkgrel=1
pkgdesc='VNC remote desktop software by RealVNC'
arch=('x86_64' 'i686')
url='https://www.realvnc.com/'
license=('custom')
depends=('glibc' 'gcc-libs' 'libice' 'libsm' 'libx11' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("VNC-${pkgver}-Linux-x64-DEB.tar.gz::https://www.realvnc.com/download/binary/1844/")
source_i686=("VNC-${pkgver}-Linux-x86-DEB.tar.gz::https://www.realvnc.com/download/binary/1843/")
source_armv7h=("VNC-${pkgver}-Linux-ARM-DEB.tar.gz::https://www.realvnc.com/download/binary/1849/")
sha1sums_x86_64=('d077ab779a6bb4f7ecdd957e1f0397946074841e')
sha1sums_i686=('d404ac7c1af031241a208f51efdd229901901bdc')
sha1sums_armv7h=('24ac66ac22b8488ef42707f8008be8ec66622c68')
options=(!strip)

build() {
    mkdir -p "$srcdir/viewer" "$srcdir/server"
    if [ "$CARCH" = "x86_64" ]
    then
        bsdtar -x -C "$srcdir/viewer" -f "$srcdir/VNC-Viewer-${pkgver}-Linux-x64.deb" data.tar.gz
        bsdtar -x -C "$srcdir/server" -f "$srcdir/VNC-Server-${pkgver}-Linux-x64.deb" data.tar.gz
    elif [ "$CARCH" = "i686" ]
    then
        bsdtar -x -C "$srcdir/viewer" -f "$srcdir/VNC-Viewer-${pkgver}-Linux-x86.deb" data.tar.gz
        bsdtar -x -C "$srcdir/server" -f "$srcdir/VNC-Server-${pkgver}-Linux-x86.deb" data.tar.gz
    elif [ "$CARCH" = "armv7h" ]
    then
        bsdtar -x -C "$srcdir/viewer" -f "$srcdir/VNC-Viewer-${pkgver}-Linux-x86.deb" data.tar.gz
        bsdtar -x -C "$srcdir/server" -f "$srcdir/VNC-Server-${pkgver}-Linux-x86.deb" data.tar.gz
    else
        bsdtar -x -C "$srcdir/viewer" -f "$srcdir/VNC-Viewer-${pkgver}-Linux-*.deb" data.tar.gz
        bsdtar -x -C "$srcdir/server" -f "$srcdir/VNC-Server-${pkgver}-Linux-*.deb" data.tar.gz
    fi
}

package_realvnc-vnc-viewer() {
    bsdtar -xv -C "$pkgdir" -f "$srcdir/viewer/data.tar.gz"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/share/doc/realvnc-vnc-viewer/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_realvnc-vnc-server() {
    depends=("${depends[@]}" 'libxtst' 'gconf')
    optdepends=('cups: Printer support')
    install='realvnc-vnc-server.install'

    bsdtar -xv -C "$pkgdir" -f "$srcdir/server/data.tar.gz"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    ln -s /usr/share/doc/realvnc-vnc-server/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
