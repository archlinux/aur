# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="anyzig"
_pkgname=(
  "${_pkgbase}-common"
  "${_pkgbase}"
  "anyzls"
)
pkgbase="${_pkgbase}-bin"
pkgname=(
  "${_pkgname[@]/%/-bin}"
)
pkgver=2026_11_03
pkgrel=1
pkgdesc="One zig to rule them all"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://marler8997.github.io/anyzig/"
_url="https://github.com/marler8997/${_pkgbase}"
license=(
  'MIT'
)
provides=(
  "${_pkgbase}"
)
conflicts=(
  "${_pkgbase}"
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${_url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgname[1]}-${pkgver}-aarch64-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[1]}-aarch64-linux.tar.gz"
  "${_pkgname[2]}-${pkgver}-aarch64-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[2]}-aarch64-linux.tar.gz"
)
source_armv7h=(
  "${_pkgname[1]}-${pkgver}-arm-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[1]}-arm-linux.tar.gz"
  "${_pkgname[2]}-${pkgver}-arm-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[2]}-arm-linux.tar.gz"
)
source_i686=(
  "${_pkgname[1]}-${pkgver}-x86-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[1]}-x86-linux.tar.gz"
  "${_pkgname[2]}-${pkgver}-x86-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[2]}-x86-linux.tar.gz"
)
source_powerpc64le=(
  "${_pkgname[1]}-${pkgver}-powerpc64le-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[1]}-powerpc64le-linux.tar.gz"
  "${_pkgname[2]}-${pkgver}-powerpc64le-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[2]}-powerpc64le-linux.tar.gz"
)
source_riscv64=(
  "${_pkgname[1]}-${pkgver}-riscv64-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[1]}-riscv64-linux.tar.gz"
  "${_pkgname[2]}-${pkgver}-riscv64-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[2]}-riscv64-linux.tar.gz"
)
source_x86_64=(
  "${_pkgname[1]}-${pkgver}-x86_64-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[1]}-x86_64-linux.tar.gz"
  "${_pkgname[2]}-${pkgver}-x86_64-linux.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname[2]}-x86_64-linux.tar.gz"
)
sha256sums=('4f22b17a0fcc2259e9fd07a02cd334342b30319d61f06a11e67b7cd219f727d8'
            '491fef2e3fe35219d5bd74c3b0d166d323e279678fca49bb48200348d04c769d')
sha256sums_aarch64=('fa82356bc96cb6e31866356cd23dfc9081271b45f16cb0c77ea8069eb3c7b660'
                    '98a0eb2b0ab6f66f864a9257221fcdfce2d6c0703c682e948c2687cae391ea35')
sha256sums_armv7h=('e63bee8df06adb4e22cd247f7c432f670ef8cda0a9f56ee4bee2041c76029032'
                   'a38252a736f1b25492d17b276c8e34419f072e7822d8d9c7e95a3506996ce284')
sha256sums_i686=('cdca78fde026c9a925e1ddc3cc512aaca3bc30c7bd05c7e73fa4a9d2c844653c'
                 '929249f7b64fb7b4b4a24fbcab01397605fa381c77fba449f69970cd0ebdeca2')
sha256sums_powerpc64le=('189ecbd2672ca2cf891a0b6f68b40b8a87673dd163eb3769dbb4ef51f85544b5'
                        '9c43fde3f4c7b0efbefef54c885fe67d2f5af7caa7e76710326c5ceae6fa60dc')
sha256sums_riscv64=('fa17d8110535540d65e690bb4a73f888e66d57834a79ee33ebb195d31c02125c'
                    '4a58f45ee46f70bf431da1407fe3fbdde73025d2dd6d4723f8c9b889913899e7')
sha256sums_x86_64=('8bc0be4b1f4067250436be7072550bf2ff87f9efbc74ad53f64fa46f254c0c06'
                   '4c26eb040e8817ad5ceab5ffea7453409b077c53b9f772f9bbcfe13948fe50d6')

package_anyzig-common-bin() {
  pkgdesc+=" (common files)"
  arch=(
    'any'
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
    "${_pkgbase}<2026_10_23"
  )

  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgbase}/LICENSE"
}

package_anyzig-bin() {
  depends=(
    "${_pkgbase}-common-bin>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${pkgname%-bin}"
}

package_anyzls-bin() {
  pkgdesc+=" (ZLS)"
  depends=(
    "${_pkgbase}-common-bin>=${pkgver}-${pkgrel}"
  )
  provides=(
    "${pkgname%-bin}=${pkgver}"
  )
  conflicts=(
    "${pkgname%-bin}"
  )

  cd "${srcdir}"
  install -vDm755 "zls" "${pkgdir}/usr/bin/${pkgname%-bin}"
}
