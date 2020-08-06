# Maintainer: Alexander Mohr <keyboard_backlight at mohr dot io>

pkgname=tp-kb-backlight-git
pkgver=1.4.0
pkgrel=1
pkgdesc='Automated keyboard backlight'
arch=('x86_64')
url='https://github.com/alexmohr/keyboard-backlight'
license=('MIT')
depends=('libinput')
makedepends=('git' 'cmake' 'gcc')
backup=('etc/systemd/system/keyboard_backlight.service')

source=("git+https://github.com/alexmohr/keyboard-backlight")
sha512sums=('SKIP')


build() {
    cd "keyboard-backlight"
    mkdir build -p
    cd build
    cmake ..
    make
}

package() {
    appname='keyboard_backlight'
    install -Dm 755 "keyboard-backlight/build/${appname}" "${pkgdir}/usr/bin/${appname}"
    install -Dm 644 "keyboard-backlight/keyboard_backlight.service" "${pkgdir}/etc/systemd/system/keyboard_backlight.service"

    echo "Please enable the systemd service via 'sudo systemctl enable --now keyboard_backlight.service"
    echo "The service file can be used for configuration."
    echo "See 'keyboard_backlight -h' for options".
}
