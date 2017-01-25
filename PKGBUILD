# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=weevely
_pkgname=weevely3
pkgver=3.4
pkgrel=1
pkgdesc="a stealth PHP web shell that provides a telnet-like console"
arch=('any')
url="https://github.com/epinna/weevely3"
license=('GPL3')
depends=(python2-prettytable python2-mako python2-dateutil python2-utils)
source=("https://github.com/epinna/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('86331c4c222dbc940bfdc8a12bfae0284ca369216e8f95ff136b6a1db99b0a33')

build() {
    sed -i 's#/usr/bin/env python#/usr/bin/env python2#' ${srcdir}/${_pkgname}-${pkgver}/weevely.py
    sed -i 's#/usr/env python#/usr/bin/env python2#' ${srcdir}/${_pkgname}-${pkgver}/modules/audit/_linuxprivchecker/linuxprivchecker.py
}

package() {
    install -dm755 "${pkgdir}/usr/"{bin,lib}
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
}
