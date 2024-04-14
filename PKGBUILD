# Maintainer: f4iey (f4iey@f6kgl.ampr.org)

pkgname=klog-bin
pkgver=2.3.4
pkgrel=1
pkgdesc="A multiplatform free hamradio logger"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.klog.xyz"
license=("GPL-3")
depends=('qt5-base' 'qt5-charts' 'qt5-serialport' 'hamlib' 'qt5-quickcontrols' 'qt5-location')
provides=(klog)
conflicts=(klog)

if [ "$CARCH" == "x86_64" ]; then
    debfile="klog_${pkgver}-${pkgrel}_amd64.deb"
    sha256sums=(9e5a5b06f38f018a7d03aeb28d11d7c8d13881a082f06dc0a40b3994247ac459)
elif [ "$CARCH" == "i686" ]; then
    debfile="klog_${pkgver}-${pkgrel}_i386.deb"
    sha256sums=(9412951ca07f33fc736f5152dfc438545d9a6df4f9276a97bc472da0d507a12b)
elif [ "$CARCH" == "armv7h" ]; then
    debfile="klog_${pkgver}-${pkgrel}_armhf.deb"
    sha256sums=(c052b3e55899d4c323a4eb461371495099d9e2b1a4574e11c05fb071914d65bb)
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
