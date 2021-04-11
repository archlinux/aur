# Maintainer: Maciej Szeptuch <neverous at neverous dot info>

_pkgbase=rpi-poe-fan
_commit=4454e1a
pkgname=rpi-poe-fan-dkms-git
pkgver=1.${_commit}
pkgrel=1
pkgdesc='Hwmon driver for Raspberry Pi PoE HAT fan'
url=https://github.com/raspberrypi/linux/blob/${_commit}/drivers/hwmon/rpi-poe-fan.c
arch=(any)
license=('GPL')
depends=(dkms)
provides=(${_pkgbase}=${pkgver}-${pkgrel})
conflicts=(${_pkgbase})
source=(
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/drivers/hwmon/rpi-poe-fan.c
    dkms.conf
    Makefile
)
b2sums=(
    '3111029ec34ce680857880317352cb097c5457243ce77f5e7ec2ae7a7f6d31cf171d4204b4cd0f828903162ba0b8b3050c8795a12edf2d6a0e56bacc15447669'
    'a70240cc2424ecade86a37acc57f2d7b55a9cf6fbf65fb1f0033e297bb4c5ebb9fc87da0b65b982f518f5a7437dd3717ca9c9a9d584144c14ca3063e068fd4de'
    'cb19c21e9bbb2995198c54d3478a09cfc1893daa6a33404611664979b0bd09729a3576542f693cb71dad005363fa330cb8d5e91c6b81292c4598aee54ae49b34'
)

package() {
    install -Dm 644 Makefile rpi-poe-fan.c dkms.conf -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
