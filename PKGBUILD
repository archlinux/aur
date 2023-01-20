# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=2.5.4
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=(i686 x86_64 armv7h)
url="http://pulsar.princeton.edu/wsjtx.html"
license=("GPL-3")
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
provides=(wsjtx)
conflicts=(wsjtx)

if [ "$CARCH" == "x86_64" ]; then
    debfile="wsjtx_${pkgver}_amd64.deb"
    sha256sums=(44d3b35b72dc8b3cb35dbc83d2dbebf4fd628d94350ffa6befb62d85762d37aa)
elif [ "$CARCH" == "armv7" ]; then
    debfile="wsjtx_${pkgver}_armhf.deb"
    sha256sums=(b02ff570a36981512e5c90e1a80f337e3b689740bc47d7cb5b088d0ae4b37e7f)
elif [ "$CARCH" == "armv8" ]; then
    rpmfile="wsjtx_${pkgver}_arm64.deb"
    sha256sums=(39bb9325c75980d1fb5743cbdffe515217202d7fc01d5aed5e778adc523392a3)
fi

source=("https://sourceforge.net/projects/wsjt/files/wsjtx-$pkgver/${debfile}")

build() {
    echo '/usr/lib/gcc/x86_64-pc-linux-gnu/7.5.0' > "$srcdir/wsjtx-bin.conf"
}
 
package() {
    cd "$srcdir"
    tar -C ${pkgdir}/ -xvf data.tar.gz
    cd "$pkgdir"
    chmod 755 usr/ usr/share/ usr/bin/ usr/share/doc/
    chmod 755 usr/share/applications/ usr/share/pixmaps/
    install -Dm644 "$srcdir/wsjtx-bin.conf" "$pkgdir/etc/ld.so.conf.d/wsjtx-bin.conf"
}
