# Maintainer: Nguyen Ky <nhktmdzhg at google mail>
pkgbase=fcitx5-lotus-bin
pkgname=('fcitx5-lotus-bin' 'fcitx5-lotus-openrc-bin' 'fcitx5-lotus-runit-bin')
pkgver=3.2.0
pkgrel=1
pkgdesc="Vietnamese input method for fcitx5"
arch=('x86_64')
url="https://github.com/LotusInputMethod/fcitx5-lotus"
license=('GPL-3.0-or-later')
source=("https://github.com/LotusInputMethod/fcitx5-lotus/releases/download/v${pkgver}/fcitx5-lotus-v${pkgver}-x86_64-archlinux.tar.zst")
sha256sums=('4a72d196fff42dc63a9b62a73e9d2d7480d26e554bf5807f76f5be12a1923f22')

package_fcitx5-lotus-bin() {
    provides=('fcitx5-lotus')
    conflicts=('fcitx5-lotus')
    depends=('fcitx5' 'libinput' 'hicolor-icon-theme' 'glibc' 'libstdc++' 'libgcc' 'libudev.so' 'python-qtpy' 'python-dbus')
    optdepends=(
        'fcitx5-lotus-openrc-bin: OpenRC service for fcitx5-lotus'
        'fcitx5-lotus-runit-bin: Runit service for fcitx5-lotus'
    )
    install='fcitx5-lotus.install'
    cp -ra "$srcdir"/usr "$pkgdir/"
}

package_fcitx5-lotus-openrc-bin() {
    depends=('fcitx5-lotus')
    pkgdesc="OpenRC init script for fcitx5-lotus"
    provides=('fcitx5-lotus-openrc')
    conflicts=('fcitx5-lotus-openrc')
    install -d "$pkgdir"/etc/init.d
    install -m755 "$srcdir"/etc/init.d/fcitx5-lotus "$pkgdir"/etc/init.d/fcitx5-lotus
}

package_fcitx5-lotus-runit-bin() {
    depends=('fcitx5-lotus')
    pkgdesc="Runit init script for fcitx5-lotus"
    provides=('fcitx5-lotus-runit')
    conflicts=('fcitx5-lotus-runit')
    install -d "$pkgdir"/etc/runit/sv/fcitx5-lotus
    install -m755 "$srcdir"/etc/runit/sv/fcitx5-lotus/run "$pkgdir"/etc/runit/sv/fcitx5-lotus/run
}