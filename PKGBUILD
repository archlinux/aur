# Maintainer: f4iey (f4iey@f6kgl.ampr.org)

pkgname=klog-bin
pkgver=2.5
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
    sha256sums=(c2466629d8d5904699bb2f716a3b604d3044a24ea95e8a9316ffab2950b6b6ea)
elif [ "$CARCH" == "i686" ]; then
    debfile="klog_${pkgver}-${pkgrel}_i386.deb"
    sha256sums=(72626b318d8ceb1a602b943250af6cdd10875b9e97c7e891cb103f7c7df8f63a)
elif [ "$CARCH" == "armv7h" ]; then
    debfile="klog_${pkgver}-${pkgrel}_armhf.deb"
    sha256sums=(164a923d2a53899781a0a43d8ee8f154bd6c102e4365575654659cadde06b89d)
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
