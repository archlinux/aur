# Maintainer: tjbp (archlinux@tjbp.net)
# Contributor: Thomas Gatzweiler <thomas.gatzweiler@gmail.com>

pkgname=wsjtx-bin
pkgver=2.7.0
pkgrel=1
pkgdesc="Software for Amateur Radio Weak-Signal Communication (JT9 and JT65)"
arch=(x86_64 armv7 aarch64)
url="https://wsjt.sourceforge.io/wsjtx.html"
license=("GPL-3")
depends=(qt5-base qt5-multimedia qt5-serialport qt5-tools libusb libusb-compat gcc-fortran libpulse libpng fftw boost-libs=1.74.0)
provides=(wsjtx)
conflicts=(wsjtx)

if [ "$CARCH" == "x86_64" ]; then
    debfile="wsjtx_${pkgver}_amd64.deb"
    sha256sums=(a2a2f7aa1e4a26fc17755df117356ce3452514629c86c69b420313cde0d0cd94)
elif [ "$CARCH" == "armv7" ]; then
    debfile="wsjtx-${pkgver}_armhf.deb"
    sha256sums=(a2c21feb473459193b9c0b63a50cb96d165e33cb66d80a6657bca960736d4fbd)
elif [ "$CARCH" == "aarch64" ]; then
    debfile="wsjtx-${pkgver}_arm64.deb"
    sha256sums=(f2d744cdc9cecd681d7551d44cac664206bed6601c6f1ba1cfad65184353bb95)
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
