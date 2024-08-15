# Maintainer: Adam Honse <calcprogrammer1@gmail.com>
pkgname=i2c-nct6793-dkms-git
pkgver=0.1.r0.g887a50d
pkgrel=1
pkgdesc="Nuvoton NCT6793 and compatible SMBus kernel driver."
arch=('i686' 'x86_64')
url="https://gitlab.com/CalcProgrammer1/i2c-nct6793-dkms"
license=('GPL-2.0-only')
depends=('dkms')
makedepends=('git')
provides=("i2c-nct6793-dkms")
conflicts=("i2c-nct6793-dkms")
source=("git+https://gitlab.com/CalcProgrammer1/i2c-nct6793-dkms")
sha256sums=('SKIP')

pkgver() {
    cd i2c-nct6793-dkms
    git describe --long --tags --abbrev=7 | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
    cd i2c-nct6793-dkms

    cp debian/dkms dkms.conf

    install -D dkms.conf            ${pkgdir}/usr/src/i2c-nct6793-dkms-0.1/dkms.conf
    install -D src/Makefile         ${pkgdir}/usr/src/i2c-nct6793-dkms-0.1/Makefile
    install -D src/i2c-nct6793.c    ${pkgdir}/usr/src/i2c-nct6793-dkms-0.1/i2c-nct6793.c
    install -D src/i2c-nct6793.conf ${pkgdir}/etc/modules-load.d/i2c-nct6793.conf
}
