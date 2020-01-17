# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=2.1.2
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=(i686 x86_64 armv7h)
url="http://physics.princeton.edu/pulsar/k1jt/wsjtx.html"
license=("GPL-3")
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw gcc7-libs)
provides=(wsjtx)
conflicts=(wsjtx)

if [ "$CARCH" == "x86_64" ]; then
    debfile="wsjtx_${pkgver}_amd64.deb"
    sha256sums=(6f1b2d36b562134e1f4d4d7e55fb06ecf49cdbae262219ce98ed35bfc2919056)
elif [ "$CARCH" == "i686" ]; then
    debfile="wsjtx_${pkgver}_i386.deb"
    sha256sums=(d08f6be879b0b70141b69932847d79aa4d1e6e191297e0268d8f7535f62e6655)
elif [ "$CARCH" == "armv7h" ]; then
    debfile="wsjtx_${pkgver}_armhf.deb"
    sha256sums=(a4cc19525895af936087b52ece2b163c135dcca2ea0d2db350246f3a421bdac8)
fi

source=("https://sourceforge.net/projects/wsjt/files/wsjtx-$pkgver/${debfile}")

build() {
    echo '/usr/lib/gcc/x86_64-pc-linux-gnu/7.5.0' > wsjtx-bin.conf
}

package() {
    cd "$srcdir"
    tar -C ${pkgdir}/ -xvf data.tar.gz
    cd "$pkgdir"
    chmod 755 usr/ usr/share/ usr/bin/ usr/share/doc/
    chmod 755 usr/share/applications/ usr/share/pixmaps/
    install -Dm644 wsjtx-bin.conf "$pkgdir /etc/ld.so.conf.d/wsjtx-bin.conf"
}
