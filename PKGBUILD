# Maintainer: Kenneth Endfinger <kaendfinger@gmail.com>

_pkgbase=udmabuf
pkgname=udmabuf-dkms
pkgver=1.3.1
pkgrel=1
pkgdesc="Userspace DMA Buffers"
arch=('i686' 'x86_64' 'armhf')
url="https://github.com/ikwzm/udmabuf"
license=('GPL2')
depends=('dkms')
conflicts=("${_pkgbase}")
source=(
    "https://github.com/ikwzm/udmabuf/archive/v${pkgver}.tar.gz"
    "dkms.conf"
)

sha512sums=('7f9b6c22d26746a45c2524f60eff4b9a35dbc18a31aa6105c71aaf8fea2c0c7903e41e6d52745b522c8bad0657164c7ca49376fba248f8a86d9e3aff33767b25'
            'cdb79d66b0b9aa32457d6d2c6f1979412348d91bec6def055694595ee3528023b05142c89396b92e3a2e1ece5d69d18c13cece0588067ec401cfb666b03ae739')

prepare() {
    mkdir -p "${srcdir}/udmabuf"
    tar zxf "${srcdir}/v${pkgver}.tar.gz" -C "${srcdir}/udmabuf" --strip-components=1
}

package() {
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    cp -r "${srcdir}/udmabuf"/* "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
