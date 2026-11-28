# Maintainer: JC Francois <jc+aur at noirextreme dot com>

pkgname=rtl8821ce-dkms-git
_pkgbase=rtl8821ce
pkgver=r193.g884b755
pkgrel=1
pkgdesc="rtl8821CE Wi-Fi driver"
arch=('i686' 'x86_64')
url="https://github.com/sewaustav/rtl8821ce"
license=('GPL2')
depends=('dkms' 'bc')
makedepends=('git' 'bc')
conflicts=("realtek-rtl8821ce-dkms-git")
replaces=("realtek-rtl8821ce-dkms-git")
source=("git+https://github.com/sewaustav/rtl8821ce")
sha256sums=('SKIP')
options=('!debug')

pkgver() {
    cd ${srcdir}/rtl8821ce
    printf 'r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd ${srcdir}/rtl8821ce
        mkdir -p ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        cp -pr * ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
        # Set name and version
        sed -e "s/@_PKGBASE@/${_pkgbase}-dkms/" \
                        -e "s/@PKGVER@/${pkgver}/" \
                        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
}
