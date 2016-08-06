# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=weevely
_pkgname=weevely3
pkgver=3.3.1
pkgrel=2
pkgdesc="a stealth PHP web shell that provides a telnet-like console"
arch=('any')
url="https://github.com/epinna/weevely3"
license=('GPL3')
depends=(python2 python2-mako python2-dateutil python2-utils)
source=("https://github.com/epinna/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('bb4094b0f845aa8937b038c4ebd2095102962d2e2c93980681eb19bde85b7bbe')

build() {
    sed -i 's#/usr/bin/env python#/usr/bin/env python2#' ${srcdir}/${_pkgname}-${pkgver}/weevely.py
    sed -i 's#/usr/env python#/usr/bin/env python2#' ${srcdir}/${_pkgname}-${pkgver}/modules/audit/_linuxprivchecker/linuxprivchecker.py
}

package() {
    install -dm755 "${pkgdir}/usr/"{bin,lib}
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
