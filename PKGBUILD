# Maintainer: Adam Honse <calcprogrammer1@gmail.com>

pkgname=touchpad-emulator-git
pkgver=0.1.r13.g5801621
pkgrel=1
pkgdesc="Virtual mouse for Linux phones"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/CalcProgrammer1/TouchpadEmulator"
license=('GPL2')
depends=('dbus' 'dbus-glib')
makedepends=('git')
provides=('touchpad-emulator')
conflicts=('touchpad-emulator')
source=("TouchpadEmulator::git+https://gitlab.com/CalcProgrammer1/TouchpadEmulator.git")
sha256sums=('SKIP')

pkgver() {
    cd TouchpadEmulator
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/TouchpadEmulator"
    make
}

package() {
    cd "$srcdir/TouchpadEmulator"
    install -Dm755 TouchpadEmulator "$pkgdir"/usr/bin/TouchpadEmulator
    install -Dm755 LaunchTouchpadEmulator.sh "$pkgdir"/usr/bin/LaunchTouchpadEmulator.sh
    install -Dm644 TouchpadEmulator.png "$pkgdir"/usr/share/icons/TouchpadEmulator.png
    install -Dm755 TouchpadEmulator.desktop "$pkgdir"/usr/share/applications/TouchpadEmulator.desktop
    install -Dm644 10-uinput.rules -t "$pkgdir"/usr/lib/udev/rules.d/
    install -Dm644 uinput.conf -t "$pkgdir"/usr/lib/modules-load.d/
}
