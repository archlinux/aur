# Maintainer: taotieren <admin@taotieren.com>
_pkgname=dcda
pkgname=dcda-git
pkgver=beta.1.0.1.r11.ge723dac
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
source=("${_pkgname}::git+https://gitee.com/danpey/${_pkgname}.git")
sha256sums=('SKIP')

pkgver()
{
    cd "${srcdir}/${_pkgname}/"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
    cd ${srcdir}/${_pkgname}/
    rm -rf build && mkdir build && cd build && qmake ../ && make
}

package()
{
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    cd ${srcdir}/${_pkgname}/pkg/
    cp --preserve=mode -r applications icons metainfo "${pkgdir}/usr/share/"
    install -Dm755 "${srcdir}/${_pkgname}/build/DCDA_Renew/DCDA_Renew" "${pkgdir}/usr/bin/DCDA_Renew"
    install -Dm755 "${srcdir}/${_pkgname}/build/DanpeCommDubugAssist/DanpeCommDubugAssist" "${pkgdir}/usr/bin/DanpeCommDubugAssist"
    ln -sf  "/usr/bin//DanpeCommDubugAssist" "${pkgdir}/usr/bin/danpecommdubugassist"
    ln -sf  "/usr/bin//DCDA_Renew" "${pkgdir}/usr/bin/dcda_renew"
}
