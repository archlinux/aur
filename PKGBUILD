# Maintainer: Gonzalo Exequiel Pedone <hipersayan DOT x AT gmail DOT com>

_pkgbase=akvcam
pkgname=${_pkgbase}-dkms
pkgver=1.1.0
pkgrel=1
pkgdesc="Virtual camera for Linux"
url="https://github.com/webcamoid/akvcam"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('dkms' 'linux-headers')
conflicts=("${_pkgbase}-dkms")
provides=("${_pkgbase}-dkms")
install="${pkgname}.install"
source=("https://github.com/webcamoid/${_pkgbase}/archive/${pkgver}.tar.gz"
        "${pkgname}.install")
md5sums=('22e54cacef55af98fe05f180217dae4c'
         '3e315711dc9e57c9ba963abea81468b1')

build() {
    cd "$srcdir/${_pkgbase}-${pkgver}/src"
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cp -vf COPYING "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    mkdir -p "${pkgdir}/usr/share/licenses/${_pkgbase}"
    cp -vf COPYING "${pkgdir}/usr/share/licenses/${_pkgbase}"
    mkdir -p "${pkgdir}/etc/${_pkgbase}/examples"
    cp -vf share/config_example.ini "${pkgdir}/etc/${_pkgbase}"
    cp -vf share/examples/output.c "${pkgdir}/etc/${_pkgbase}/examples"
    cd "${srcdir}/${_pkgbase}-${pkgver}/src"
    cp -ar * "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    cd "${pkgdir}/usr/src/${_pkgbase}-${pkgver}"
    make clean
}
