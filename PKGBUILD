# Maintainer: Onur BÜBER <onurbuber@engineer.com>

pkgname=tuxedo-keyboard-tools
pkgver=1.4
pkgrel=2
pkgdesc='Tools for TUXEDO Laptops'
arch=('x86_64')
url='https://github.com/onurbbr/tuxedo-keyboard-tools'
license=('GPL')
provides=('tuxedo-keyboard-tools')
conflicts=('tuxedo-keyboard-tools')
depends=('tuxedo-keyboard-dkms'
		 'sudo'
		 'libxss')
makedepends=('gcc')
install="${pkgname}.install"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a916b8a04b5daebf6bea02eb26f61315851e4495aeb609baaa571cdb7bb22a29')

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    sed -i 's/sudo/wheel/g' tuxedo-keyboard-idle
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 2

    install -Dm755 idle ${pkgdir}/opt/tuxedo-keyboard-tools/idle
    install -Dm755 tuxedo-color-changer ${pkgdir}/usr/bin/tuxedo-color-changer
    install -Dm755 idle.sh ${pkgdir}/opt/tuxedo-keyboard-tools/idle.sh
    install -Dm755 keep.sh ${pkgdir}/opt/tuxedo-keyboard-tools/keep.sh
    install -Dm750 tuxedo-keyboard-idle ${pkgdir}/etc/sudoers.d/tuxedo-keyboard-idle
    install -Dm644 tuxedo-keyboard-keep-light-level.service ${pkgdir}/etc/systemd/system/tuxedo-keyboard-keep-light-level.service
    install -Dm644 tuxedo-keyboard-idle.service ${pkgdir}/etc/systemd/user/tuxedo-keyboard-idle.service
}
