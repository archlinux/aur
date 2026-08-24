# Maintainer: Shayne Hartford <shayneehartford@gmail.com>

pkgname=(vr-lighthouse-bin liblighthouse-bin)
_pkgname=lighthouse
pkgver=2.0.0
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/ShayBox/$_pkgname"
license=('MIT')
depends=('libdbus' 'gcc-libs')

case "$CARCH" in
  x86_64) _target='x86_64-unknown-linux-gnu' ;;
  aarch64) _target='aarch64-unknown-linux-gnu' ;;
esac

source=("${url}/releases/download/${pkgver}/${_pkgname}-${_target}"
        "${url}/releases/download/${pkgver}/lib${_pkgname}-${_target}.so"
        "${url}/releases/download/${pkgver}/lighthouse.h")

sha512sums_x86_64=('a46c36d025f516b208e1a60731a3605bdfd36cb5518997140a216f4677b66c189d3f216275b659b3a391d70559f78ceb6abb815b2a9eb4df3f4e93fe87c02862'
                   'f18716ae680c855ee05885d6bfd7386406d068a316b593b2cd018c6ba711fd157b0ca692d0727fcbf796c22bf4907023b96f58e2fbf25ccc2a7612bc5617c21c'
                   'a1cf307d4bedec7187058b925ac36d583c53dc2a5b1d3c547e71cb0525b84cf39245b96cd2676e41dec025cada2d0289fd64caff6c4df07afba02386b0538c93')

sha512sums_aarch64=('0d72e695b8fa445d2209f9168212c9688b30791a7a97f718bafba41853018c4b72a8e5ca1437a0502a4139203152905a3ba0fddd2d7f58206e69f9f219ba7fa5'
                    'cdb27b82c84edbebbf03c7b5bc397567e53dc651ff041d9cb158d9a611b730cdcd3464e9aabacca3999f6402662b1de471fa79007696587b1dccb62abd055449'
                    'a1cf307d4bedec7187058b925ac36d583c53dc2a5b1d3c547e71cb0525b84cf39245b96cd2676e41dec025cada2d0289fd64caff6c4df07afba02386b0538c93')

package_vr-lighthouse-bin() {
  pkgdesc="VR Lighthouse power state management in Rust"
  install -Dm755 "${_pkgname}-${_target}" "${pkgdir}/usr/bin/${_pkgname}"
}

package_liblighthouse-bin() {
  pkgdesc="C library and headers for VR Lighthouse base station control"
  install -Dm755 "lib${_pkgname}-${_target}.so" "${pkgdir}/usr/lib/lib${_pkgname}.so"
  install -Dm644 lighthouse.h "${pkgdir}/usr/include/lighthouse.h"
}
