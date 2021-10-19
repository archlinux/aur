# Maintainer: Adam Honse <calcprogrammer1@gmail.com>

pkgname=touchpad-emulator-git
pkgver=r1.0
pkgrel=1
pkgdesc="Virtual mouse for Linux phones"
arch=('aarch64')
url="https://gitlab.com/CalcProgrammer1/TouchpadEmulator"
license=('GPL2')
depends=('dbus dbus-glib')
makedepends=('git make')
optdepends=('')
provides=('touchpad-emulator')
conflicts=('touchpad-emulator')
source=("TouchpadEmulator::git+https://gitlab.com/CalcProgrammer1/TouchpadEmulator.git")
sha256sums=('SKIP')

pkgver() {
    cd TouchpadEmulator
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
}
