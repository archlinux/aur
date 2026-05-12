# Maintainer: BigBrainRobin29

pkgname=scrcpy-bin
pkgver=4.0
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
sha256sums=('7daf05af5d575862e62b068cf6852d6068faf7ef3178f3735e3953e778fbf0ab' '8919976f02f450bc0b803caa3b6c8c0305f3cea3b2665bdea566bdba48841af3')

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