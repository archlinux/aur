# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgbase=realvnc-vnc
pkgname=('realvnc-vnc-viewer' 'realvnc-vnc-server')
pkgver=5.3.2
pkgrel=1
pkgdesc='VNC remote desktop software by RealVNC'
arch=('x86_64' 'i686' 'armv7h')
url='https://www.realvnc.com/'
license=('custom')
depends=('glibc' 'gcc-libs' 'libice' 'libsm' 'libx11' 'libxext')
conflicts=('tightvnc' 'tigervnc' 'turbovnc')
source_x86_64=("VNC-${pkgver}-Linux-x64-DEB.tar.gz::https://www.realvnc.com/download/file/vnc.files/VNC-${pkgver}-Linux-x64-DEB.tar.gz")
source_i686=("VNC-${pkgver}-Linux-x86-DEB.tar.gz::https://www.realvnc.com/download/file/vnc.files/VNC-${pkgver}-Linux-x86-DEB.tar.gz")
source_armv7h=("VNC-${pkgver}-Linux-ARM-DEB.tar.gz::https://www.realvnc.com/download/file/vnc.files/VNC-${pkgver}-Linux-ARM-DEB.tar.gz")
sha1sums_x86_64=('2c1821eb4a590bf7892d0deaed445793e3be55be')
sha1sums_i686=('41abcc35124e9fdac9e0e2e7cf0266103be4b9fb')
sha1sums_armv7h=('cb91d82b31a2416b2964e9546d67c540f63e0603')
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
        bsdtar -x -C "$srcdir/viewer" -f "$srcdir/VNC-Viewer-${pkgver}-Linux-ARM.deb" data.tar.gz
        bsdtar -x -C "$srcdir/server" -f "$srcdir/VNC-Server-${pkgver}-Linux-ARM.deb" data.tar.gz
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
