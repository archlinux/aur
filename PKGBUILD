# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
# Contributor: Alex Sarum <rum.274.4 at gmail dot com>
# Contributor: Gavin Lloyd <gavinhungry@gmail.com>
# Contributor: Bailey Fox <bfox200012@gmail.com>
# Contributor: Tony Lambiris <tony@libpcap.net>

pkgname=meanalyzer
_pkgname=MEAnalyzer
_tag=r373
_pkgver="${_tag#v}"
pkgver=1.307.0.r373
pkgrel=1
pkgdesc="Intel Engine & Graphics Firmware Analysis Tool"
arch=('any')
url="https://github.com/platomav/MEAnalyzer"
license=('BSD-2-Clause-Patent')
depends=('python' 'python-colorama' 'python-crccheck' 'python-pltable')
makedepends=('dos2unix')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_tag}.tar.gz")
sha256sums=('11e6863369da6aee6d8377d05178a5ed4511cee86e0267ad367367e5b7d94e1f')

pkgver() {
    cd "${_pkgname}-${_pkgver}"
    printf "%s.%s" \
        "$(sed -n 's/.*ME Analyzer v\([0-9]\+\.[0-9]\+\.[0-9]\+\).*/\1/p' MEA.py)" \
        "$(sed -n 's/.*Revision \(r[0-9]\+\).*/\1/p' MEA.dat)"
}

prepare() {
    cd "${_pkgname}-${_pkgver}"
    dos2unix *
}

package() {
    cd "${_pkgname}-${_pkgver}"
    install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" *.dat
    install -Dm755 -t "${pkgdir}/usr/lib/${pkgname}" *.py
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/${pkgname}/MEA.py" "${pkgdir}/usr/bin/${pkgname}"
}
