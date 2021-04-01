# Maintainer: taotieren <admin@taotieren.com>

_pkgname=dcda
pkgname=dcda
pkgver=1.0.1_beta
pkgrel=1
pkgdesc="本软件支持串口 / TCP Server / TCP Client 三合一的通讯调试工具。"
arch=('any')
url="https://gitee.com/danpey/dcda"
license=('LGPL3')
provides=(${pkgname})
conflicts=(${pkgname})
#replaces=(${pkgname})
depends=('qt5-svg' 'qt5-serialport' 'qt5-multimedia')
makedepends=('git' 'qt5-svg' 'qt5-serialport' 'qt5-multimedia')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${_pkgname}.tar.gz::https://gitee.com/danpey/${_pkgname}/repository/archive/beta-1.0.1?format=tar.gz")
sha256sums=('d4e24ad81ac3b08dfa343edf9ba68bb65ee41cee21093adc398adac8622d3ffa')

build() 
{
    tar -zxf "${srcdir}/${_pkgname}.tar.gz" -C "${srcdir}/${_pkgname}"
    cd "${srcdir}/${_pkgname}/"
    mkdir build && cd build && qmake ../ && make
}

package() 
{
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd ${srcdir}/${_pkgname}/pkg/
    cp --preserve=mode -r applications icons metainfo "${pkgdir}/usr/share/"
    install -Dm755 "${srcdir}/${_pkgname}/build/DCDA_Renew/DCDA_Renew" "${pkgdir}/usr/bin/dcda_renew" 
    install -Dm755 "${srcdir}/${_pkgname}/build/DanpeCommDubugAssist/DanpeCommDubugAssist" "${pkgdir}/usr/bin/danpecommdubugassist" 
}
