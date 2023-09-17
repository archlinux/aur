# Maintainer: badcast <lmecomposer@gmail.com>
_pkgbase="dragon-tea"
pkgname=${_pkgbase}
pkgver=1.0.3
pkgrel=0
url="https://github.com/badcast/${_pkgbase}"
pkgdesc="Dragon Tea. Free Messenger"
arch=('any')
license=('GPL3')
depends=('glib2' 'gtk3' 'json-c' 'curl')
makedepends=('make' 'cmake' 'gcc')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.github.com/badcast/${pkgname}/tar.gz/refs/tags/v${pkgver}"
        "dragon-tea.desktop")
sha256sums=('cc598e6815f3de8d80ef5ae23fc1e49be5181e9805e50875e5d228508bd3d112'
            'd07ed3f1c38a7e36dce5d49b1f20160e28df309ae73d612e7375051a57fc084e')

build(){
   cmake -S "${srcdir}/${_pkgbase}-${pkgver}" -B "${srcdir}/build-${pkgver}-${pkgrel}" -DCMAKE_BUILD_TYPE=Release
   cmake --build "${srcdir}/build-${pkgver}-${pkgrel}"
}

package(){
    install -Dm755 "${srcdir}/build-${pkgver}-${pkgrel}/dragontea" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/dragon-tea.desktop" -t "${pkgdir}/usr/share/applications"
}
