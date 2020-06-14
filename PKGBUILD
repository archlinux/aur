# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=2.2.1
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
    sha256sums=(5ed4e800af15066cc1d203b9d58df32a8f3c7d6304ad67e03eac4013aab49208)
elif [ "$CARCH" == "i686" ]; then
    debfile="wsjtx_${pkgver}_i386.deb"
    sha256sums=(49ebab52f6c2f4fc65baa7b20fb87395de04af820409f00e42eceddcef97db38)
elif [ "$CARCH" == "armv7h" ]; then
    debfile="wsjtx_${pkgver}_armhf.deb"
    sha256sums=(7f8b63be7c3f389ee09d1e36e12e45343c2b9b5fa88cf2e13672f698b4aeec56)
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
