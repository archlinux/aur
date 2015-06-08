# Author (initial package): Patrick Auernig <patrick.auernig@gmail.com>
# Author (fixes): Marco Neumann <marco@crepererum.net>

pkgname=sixfireusb-dkms
pkgver=0.6.1
pkgrel=2
pkgdesc="Kernel modules for the Terratec DMX6FireUSB soundcard"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/sixfireusb"
license=('GPL')
depends=('dkms')
optdepends=('linux-headers: build the module against Arch kernel')
source=(http://sourceforge.net/projects/sixfireusb/files/sixfireusb-$pkgver.tar.bz2
        kernel-3.16.patch
        grsecurity.patch
        dkms.conf
)
sha512sums=(
    '6428fe074dd2717bcf6f2bdb38b5612694d66254021cc5a627ef5bccf2a7cbfd0e8cb9ca4be4f9855fe89d9be47a9943bbf368d8aec45eda08e4290ede9e9d34'
    '9d612518c48873d1ae9bd28a55b7a54cbb8e4836a87cf9c8870ae5038850107539b3b13684610f31aa2543dae3123cc88f02e477a891d2c3baae6157b0151083'
    '1c5ed0652f83f68c12c05b6675af85ded4b31696db0c07047555ee028f82ecf5c69a1de3d452e82ee137187254f6c27305ee650cc636e003ba1ebeedc007017a'
    '43880b03da504b390471084e140e3b119080621792a9aad41e92e7372fb56fe88321289419f04ce33687955d45dfff049d3ba9b2df5eefee3d061ecb597372d8'
)
install=sixfireusb.install

build() {
    cd "${srcdir}"/sixfireusb-$pkgver
    patch -Np1 -i ../kernel-3.16.patch
    patch -Np1 -i ../grsecurity.patch
}

package() {
    cd ${srcdir}

    install -dm755 "${pkgdir}/usr/src/sixfireusb-${pkgver}"

    cp -r ${srcdir}/sixfireusb-${pkgver}/* "${pkgdir}/usr/src/sixfireusb-${pkgver}/"
    cp ${srcdir}/dkms.conf "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
    sed -i -e "s/@VERSION@/${pkgver}/" "${pkgdir}/usr/src/sixfireusb-${pkgver}/dkms.conf"
}

