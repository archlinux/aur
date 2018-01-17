# Maintainer <kaendfinger@gmail.com>

_pkgbase=udmabuf
pkgname=udmabuf-dkms
pkgver=0.9.0
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

md5sums=('c73aca7abc1c5c71a7bf8fc6a79d3edf'
         '4c6290fe3ff6260cf66b1463158896df')

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
