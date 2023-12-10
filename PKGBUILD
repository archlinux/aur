# Maintainer: Yishen Miao <mys721tx at gmail dot com>
# Contributor: Maciej Szeptuch <neverous at neverous dot info>

_pkgbase=vcio
_commit=324f7e52
pkgname=${_pkgbase}-dkms-git
pkgver=6.${_commit}
pkgrel=2
pkgdesc='Character device driver for VC4 mailbox'
url=https://github.com/raspberrypi/linux/blob/${_commit}/drivers/char/broadcom/vcio.c
arch=(any)
license=('GPL')
depends=(dkms)
provides=(${_pkgbase}=${pkgver}-${pkgrel})
conflicts=(${_pkgbase})
source=(
    https://raw.githubusercontent.com/raspberrypi/linux/${_commit}/drivers/char/broadcom/vcio.c
    dkms.conf
    Makefile
)
sha256sums=(
    '06c58eb27872de4ff581cc77dec34b307d5de098fa81e0237e6309062ec46aea'
    'd0d0fde95be8b1e9ad37de3a6a08e048729f5503545140357f31d3c3289613ac'
    'f0ecf0592234f1a4df517a6917334537df18ffe9803b52e88ab1a79bc475deaf'
)

package() {
    install -Dm 644 Makefile vcio.c dkms.conf -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
