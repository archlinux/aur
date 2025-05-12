# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-ref_vk'
pkgver='1.0.10'
pkgrel='1'
arch=('i686' 'x86_64')
pkgdesc='Vulkan renderer for yamagi-quake2'
url='https://github.com/yquake2/ref_vk/'
license=('GPL-2.0-only' 'MIT' 'Unlicense')
depends=('glibc' 'yamagi-quake2' 'sdl3')
makedepends=('vulkan-headers')
optdepends=('vulkan-validation-layers')
source=("${pkgname##*-}-${pkgver}.tar.gz"::"https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a9616a081ce5793e9e2b4070eab5d1d34d111a9c3946aa8a870f96f25c7b264ec1a6fe99b06590bcd470813533b10809ab764fe7322927e9d8323af68e68fdfd')

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
