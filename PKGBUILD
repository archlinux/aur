# Maintainer: Jorge Pizarro-Callejas (aka jorgicio) <jpizarrocallejas@gmail.com>

pkgname=libvmaf-compat
_pkgname=vmaf
pkgver=2.3.1
pkgrel=1
pkgdesc='Perceptual video quality assessment algorithm based on multi-method fusion (v2 compatibility)'
arch=('x86_64')
url='https://github.com/Netflix/vmaf/'
license=('BSD')
depends=('gcc-libs')
makedepends=('meson' 'nasm' 'vim' 'doxygen')
provides=('vmaf=2.3.1' 'libvmaf=2.3.1')
conflicts=('vmaf=2.3.1' 'libvmaf=2.3.1')
options=('!lto')
source=("https://github.com/Netflix/vmaf/archive/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('8d60b1ddab043ada25ff11ced821da6e0c37fd7730dd81c24f1fc12be7293ef2')

build() {
    arch-meson "${_pkgname}-${pkgver}/libvmaf/build" "${_pkgname}-${pkgver}/libvmaf"
    ninja -v -C "${_pkgname}-${pkgver}/libvmaf/build"
}

#check() {
#    ninja -v -C "${_pkgname}-${pkgver}/libvmaf/build" test
#}

package() {
    DESTDIR="$pkgdir" ninja -v -C "${_pkgname}-${pkgver}/libvmaf/build" install
    rm -rf "$pkgdir"/usr/{include,bin}
    rm -rf "$pkgdir"/usr/lib/{libvmaf.so,pkgconfig,libvmaf.a}
    #install -D -m755 "${pkgname}-${pkgver}/libvmaf/build/tools/vmafossexec" -t "${pkgdir}/usr/bin"
    #install -D -m644 "${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    #cp -dr --no-preserve='ownership' "${pkgname}-${pkgver}/model" "${pkgdir}/usr/share"
}
