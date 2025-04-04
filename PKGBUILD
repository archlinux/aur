# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Yamashiro <dev cosmicheron com>

_pkgbase='yamagi-quake2-ref_vk'
pkgname="${_pkgbase}-git"
pkgver='1.0.9.r3.g21bde3c'
pkgrel='1'
arch=('i686' 'x86_64')
pkgdesc="Vulkan renderer for yamagi-quake2 (development version)"
url='https://github.com/yquake2/ref_vk'
license=('GPL-2.0-only' 'MIT' 'Unlicense')
depends=('glibc' 'yamagi-quake2' 'sdl3')
optdepends=('vulkan-validation-layers')
makedepends=('vulkan-headers')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("${_pkgbase}::git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgbase"
    git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
    make -C "$_pkgbase" WITH_SDL3=yes
}

package() {
    cd "$_pkgbase"

    # library
    install -Dm644 'release/ref_vk.so' "${pkgdir}/usr/lib/yamagi-quake2/ref_vk.so"

    # doc
    install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"

    # license
    install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}
