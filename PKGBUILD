# Maintainer: f4iey (f4iey@f6kgl.ampr.org)

pkgname=klog-bin
pkgver=2.3
pkgrel=1
pkgdesc="A multiplatform free hamradio logger"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.klog.xyz"
license=("GPL-3")
depends=('qt5-base' 'qt5-charts' 'qt5-serialport' 'hamlib')
provides=(klog)
conflicts=(klog)

if [ "$CARCH" == "x86_64" ]; then
    debfile="klog_${pkgver}-${pkgrel}_amd64.deb"
    sha256sums=(e690862f82388eb50f875032f060609fa9901d8765cf2321e4e8a077bdf34791)
elif [ "$CARCH" == "i686" ]; then
    debfile="klog_${pkgver}-${pkgrel}_i386.deb"
    sha256sums=(c84ff4356451982b6640e9f2448deac103443174b8f4867ed85c521d2f39ac65)
elif [ "$CARCH" == "armv7h" ]; then
    debfile="klog_${pkgver}-${pkgrel}_armhf.deb"
    sha256sums=(480f23862d491656853e171d53a29b924606e85284aab1b558e94a4f1d919d24)
fi

source=("http://ftp.fr.debian.org/debian/pool/main/k/klog/${debfile}")

build() {
    echo '/usr/lib/gcc/x86_64-pc-linux-gnu/7.5.0' > "$srcdir/klog-bin.conf"
}

package() {
    cd "$srcdir"
    tar -C ${pkgdir}/ -xvf data.tar.xz
    cd "$pkgdir"
    chmod 755 usr/ usr/share/ usr/bin/ usr/share/doc/
    chmod 755 usr/share/applications/ usr/share/pixmaps/
    install -Dm644 "$srcdir/klog-bin.conf" "$pkgdir/etc/ld.so.conf.d/klog-bin.conf"
}
