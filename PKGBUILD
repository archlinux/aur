# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
pkgname=leds-valve-dkms-git
pkgver=0.1.r0.gc34a035
pkgrel=1
pkgdesc="Valve Steam Machine LED strip kernel driver from SteamOS kernel."
arch=('i686' 'x86_64')
url="https://gitlab.com/CalcProgrammer1/leds-valve-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=("leds-valve-dkms")
conflicts=("leds-valve-dkms")
source=("git+https://gitlab.com/CalcProgrammer1/leds-valve-dkms")
sha256sums=('SKIP')

pkgver() {
    cd leds-valve-dkms
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd leds-valve-dkms

    cp debian/dkms dkms.conf

    install -D dkms.conf            ${pkgdir}/usr/src/leds-valve-dkms-0.1/dkms.conf
    install -D src/Makefile         ${pkgdir}/usr/src/leds-valve-dkms-0.1/Makefile
    install -D src/leds-valve.c     ${pkgdir}/usr/src/leds-valve-dkms-0.1/leds-valve.c
}
