# Maintainer: Scott Shumate <scott(at)shumatech(dot)com>
pkgname=evjs
pkgver=0.1.0
pkgrel=1
pkgdesc="Joystick auto-calibration and testing utility for evdev and joydev"
arch=(x86_64)
url="https://github.com/shumatech/evjs"
license=('GPL')
depends=('ncurses' 'sqlite3')
provides=('evjs')
makedepends=('autoconf')
source=("https://github.com/shumatech/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd ${pkgname}-${pkgver}
    ./bootstrap
    ./configure --prefix=/usr
    make
}

package() {
    cd ${pkgname}-${pkgver}
    make DESTDIR="$pkgdir" install
    install -D -m 0644 -o root -g root evjs.rules ${pkgdir}/etc/udev/rules.d/99-evjs.rules
}
