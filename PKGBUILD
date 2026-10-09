# Maintainer: f4iey (f4iey@f6kgl.ampr.org)

pkgname=klog-bin
pkgver=2.5.2
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
    sha256sums=(0055cb379c3b915967f20c7a24be27ce7f42f3c830f29efeb75a11e65d4745cd)
elif [ "$CARCH" == "i686" ]; then
    debfile="klog_${pkgver}-${pkgrel}_i386.deb"
    sha256sums=(fbcaf26e1670fd055330d6cca8583c8cd043808964f373267050d271a29bb581)
elif [ "$CARCH" == "armv7h" ]; then
    debfile="klog_${pkgver}-${pkgrel}_armhf.deb"
    sha256sums=(3eb28522811f89e9fa06d360e031d15287c6a2efb406069800674c4b10bc7b1a)
fi

source=("https://ftp.fr.debian.org/debian/pool/main/k/klog/${debfile}")

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
