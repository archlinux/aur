# Maintainer: orb1n

pkgname=scrcpy-bin
pkgver=4.1
pkgrel=1
pkgdesc="Display and control your Android device"
arch=('x86_64')
url="https://github.com/Genymobile/scrcpy"
license=("Apache-2.0")
depends=('glibc' 'libcap' 'systemd-libs' 'android-tools')
optdepends=('libusb: USB connection support')
provides=('scrcpy')
conflicts=('scrcpy')
source=("https://github.com/Genymobile/scrcpy/releases/download/v${pkgver}/scrcpy-linux-x86_64-v${pkgver}.tar.gz" 'scrcpy.desktop')
sha256sums=('ad56ae8bfeedf41e824945c11dbf55fcb092b3e615b9b486f48a50e30d389635' '8919976f02f450bc0b803caa3b6c8c0305f3cea3b2665bdea566bdba48841af3')

package() {
    cd "$srcdir/scrcpy-linux-x86_64-v${pkgver}"

    install -dm755 "$pkgdir/opt/scrcpy"
    install -Dm755 scrcpy adb "$pkgdir/opt/scrcpy/"
    install -Dm644 scrcpy-server scrcpy.png disconnected.png "$pkgdir/opt/scrcpy/"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /opt/scrcpy/scrcpy "$pkgdir/usr/bin/scrcpy"
    install -Dm644 scrcpy.1 -t "$pkgdir/usr/share/man/man1/"
    install -Dm644 "$srcdir/scrcpy.desktop" -t "$pkgdir/usr/share/applications/"
}
