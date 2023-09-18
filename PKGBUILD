# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="dragon-tea"
pkgname=${_pkgbase}
pkgver=1.0.4
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Dragon Tea. Free Messenger"
arch=('any')
license=('GPL3')
depends=('glib2' 'gtk3' 'json-c' 'curl')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}"
        "dragon-tea.desktop")
sha256sums=('c16e1906ba7d5a6a276b188e3ddbaf3c1b7b8ad87b00df674a2f12a6c3252ce3'
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
