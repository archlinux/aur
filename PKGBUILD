# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-ref_vk'
pkgver='1.0.9'
pkgrel='2'
arch=('i686' 'x86_64')
pkgdesc='Vulkan renderer for yamagi-quake2'
url='https://github.com/yquake2/ref_vk/'
license=('GPL-2.0-only' 'MIT' 'Unlicense')
depends=('glibc' 'yamagi-quake2' 'sdl3')
makedepends=('vulkan-headers')
optdepends=('vulkan-validation-layers')
source=("${pkgname##*-}-${pkgver}.tar.gz"::"https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('1d72d6e24eed73160b18f53b0f874ae1f2db1626d90cee6ef871f716c35c1640719763e412a4658ac4e3d1ca064278466096371be4ffb829dcb98a79a3f1b581')

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
