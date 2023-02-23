# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=2.6.1
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=(i686 x86_64 armv7h)
url="https://wsjt.sourceforge.io/wsjtx.html"
license=("GPL-3")
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw)
provides=(wsjtx)
conflicts=(wsjtx)

if [ "$CARCH" == "x86_64" ]; then
    debfile="wsjtx_${pkgver}_amd64.deb"
    sha256sums=(f7825425496ba4e6d4018ab65f5f3e07d619a9da29b751e753c72912bcdd511c)
elif [ "$CARCH" == "armv7" ]; then
    debfile="wsjtx_${pkgver}_armhf.deb"
    sha256sums=(ace10090d45c4954796658a963dbd4f92a1174a9ab2657d347e73e15f9126593)
elif [ "$CARCH" == "armv8" ]; then
    rpmfile="wsjtx_${pkgver}_arm64.deb"
    sha256sums=(c46b0ea1f26ebc0d3e8e295ad36dee2bb594c56db17d83426e2448298c7bb00c)
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
