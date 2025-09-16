# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-ref_vk'
pkgver='1.0.11'
pkgrel='1'
arch=('i686' 'x86_64')
pkgdesc='Vulkan renderer for yamagi-quake2'
url='https://github.com/yquake2/ref_vk/'
license=('GPL-2.0-only' 'MIT' 'Unlicense')
depends=('glibc' 'yamagi-quake2' 'sdl3')
makedepends=('vulkan-headers')
optdepends=('vulkan-validation-layers')
source=("${pkgname##*-}-${pkgver}.tar.gz"::"https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('c6c26202f6853019ed41978eabe3635e4ee5e5f990d3cb8d267c5bdb746138643867f3842791f133764dd462936e5030b733e5794f008fca106d8124d4e4a629')

build() {
    make -C "${pkgname##*-}-${pkgver}" WITH_SDL3=yes
}

package() {
    cd "${pkgname##*-}-${pkgver}"

    # library
    install -Dm644 'release/ref_vk.so' "${pkgdir}/usr/lib/yamagi-quake2/ref_vk.so"

    # doc
    install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # license
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
