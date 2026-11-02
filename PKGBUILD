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
pkgver=2026_10_23
pkgrel=3
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
sha256sums=('4cf0cb1eff9e991243f36225ece249760a47b7387e6e518afc873e6fdb01c364'
            '491fef2e3fe35219d5bd74c3b0d166d323e279678fca49bb48200348d04c769d')
sha256sums_aarch64=('196e43be6ef5a7d748b98b2d5c6fb976d1c24ff76da5cfbd1a898ed6755e0504'
                    '196e43be6ef5a7d748b98b2d5c6fb976d1c24ff76da5cfbd1a898ed6755e0504')
sha256sums_armv7h=('546a5cb9c63cbccdf42b4ba0f1f023963d7405e4283c1047266e58bc37b0b670'
                   '20cd7373c2ebe3ae8739dfb3b1ba4242d49d39688019eaca2f3efd7506dc8581')
sha256sums_i686=('72900004242bf8cf354dcd499ad75a17f2ba8382f0a41fc8bbe51c6725f7486a'
                 '6d8359f0a348e49cebe26e25ef13e396970b1bc764842ac6b0b163274c81fd2c')
sha256sums_powerpc64le=('a6f8852cb7452af84856a637cdcc630a0d8da5ec1d5b6f8d261c25639ba029c5'
                        '2a9ccb0937ea59c6fb704aa33fb7801b69c1a147e01d7836d58fd1e40d05a485')
sha256sums_riscv64=('8b7c12972161899c73706a24825f0162586a6e6f3c00aeb6d5f9756bde63f7fc'
                    'b8f47a44d95a11b01d1bd4ca05561dbb0c58c283ee8fed3035af9af0615411e7')
sha256sums_x86_64=('9475f2aba65240f7a3d402d8b8d98ea4e96eb2540a40308490a9e7b5215222f1'
                   'c6f2632b48d481104628ce2738c661745f69ce7ec41059940d023fd87e0e11ca')

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
