# Maintainer: f4iey (f4iey@f6kgl.ampr.org)

pkgname=klog-bin
pkgver=2.3
pkgrel=2
pkgdesc="A multiplatform free hamradio logger"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.klog.xyz"
license=("GPL-3")
depends=('qt5-base' 'qt5-charts' 'qt5-serialport' 'hamlib' 'qt5-quickcontrols' 'qt5-location')
provides=(klog)
conflicts=(klog)

if [ "$CARCH" == "x86_64" ]; then
    debfile="klog_${pkgver}-${pkgrel}_amd64.deb"
    sha256sums=(810825b916cae73a334766b2d6b80892d6157facfd4dd52360390c0478350238)
elif [ "$CARCH" == "i686" ]; then
    debfile="klog_${pkgver}-${pkgrel}_i386.deb"
    sha256sums=(f45fda198d4992771c4886d729d01443b8c626c20fda62cd648e2fcf26ae14ee)
elif [ "$CARCH" == "armv7h" ]; then
    debfile="klog_${pkgver}-${pkgrel}_armhf.deb"
    sha256sums=(6a978b879e9a684fff32b3ba6fe5466e283062b17c910a8d871ae4f34fdfa7cf)
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
