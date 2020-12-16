pkgname=mt7601u-dkms-git
_pkgbase=mt7601u
pkgver=latest
pkgrel=1
pkgdesc="mt7601u DKMS driver"
arch=('i686' 'x86_64')
url="https://github.com/jeremyb31/mt7601u-5.3"
license=('GPL2')
depends=('dkms')
makedepends=('git')
conflicts=("${_pkgbase}" 'mt7601u-ap-dkms' 'mt7601u-firmware')
source=("git+https://github.com/jeremyb31/mt7601u-5.3"
        'dkms.conf')
sha256sums=('SKIP'
            '284e8510ca40bf1f782a2987c9fef7f7179d6390a5a944c397be0d380ff2e5ee')


pkgver() {
    cd ${srcdir}/mt7601u-5.3
    printf "%s" "${pkgver}"
}

package() {
        cd ${srcdir}/mt7601u-5.3
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        sed -e "s/@PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
