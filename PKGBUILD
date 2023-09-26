# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="dragon-tea"
pkgname=${_pkgbase}
pkgver=1.0.5
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Dragon Tea. Free Messenger"
arch=('any')
license=('GPL3')
depends=('glib2' 'gtk3' 'json-c' 'curl')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}"
        "dragon-tea.desktop")
sha256sums=('57871b8b15d62b85906782fd40e16417c5e2186858d7970141b010afa9f52933'
            'd07ed3f1c38a7e36dce5d49b1f20160e28df309ae73d612e7375051a57fc084e')

build(){
   cmake -S "${srcdir}/${_pkgbase}-${pkgver}" -B "${srcdir}/build-${pkgver}-${pkgrel}" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
   cmake --build "${srcdir}/build-${pkgver}-${pkgrel}"
}

package(){
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build-${pkgver}-${pkgrel}"
    install -Dm644 "${srcdir}/dragon-tea.desktop" -t "${pkgdir}/usr/share/applications"
    chmod 755 "${pkgdir}/usr/bin/dragontea"
}
