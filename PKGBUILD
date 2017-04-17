# Maintainer: Fabian Lesniak <fabian at lesniak-it dot de>

_pkgbase=emi
pkgname=${_pkgbase}-dkms
pkgver=20131209
pkgrel=1
pkgdesc="Improved driver for EMI a2|6/a6|2m audio interfaces including newer firmware"
arch=('x86_64' 'i686')
url="http://xiphmont.livejournal.com/62676.html"
license=('GPL')
depends=('dkms')

source=("https://people.xiph.org/~xiphmont/emagic/${_pkgbase}-${pkgver}.tgz"
        "dkms.conf"
        "emi.conf")

sha256sums=('5068dda4af18274e3e844035855583f33019e1cff7178bf6e5d96d8a5f4d24cb'
            'da355b81b20c9939867d78a8f4bc2278c36b7862eaf2745fa73139062dcab546'
            '92cd0fc6de8fc30ed5f1798ce02877ba611bd3b63f4c818ccf2dd95afe301c82')

prepare() {
  cd "$srcdir/$_pkgbase-$pkgver"
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"

  install -Dm644 -t "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/ ${srcdir}/${_pkgbase}-${pkgver}/{Makefile,emi.c}
  install -Dm644 -t "${pkgdir}"/usr/lib/firmware/emi/ ${srcdir}/${_pkgbase}-${pkgver}/firmware/*
  install -Dm644 ${srcdir}/emi.conf "${pkgdir}"/usr/lib/modprobe.d/emi.conf
  install -Dm644 ${srcdir}/dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
