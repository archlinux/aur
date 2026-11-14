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
pkgver=2026_11_12
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
sha256sums_aarch64=('ff73c6d63749050dc941f4f872165f2bd6c95d40efef9dee409a888803608ba9'
                    'd4bc30b44720fb637cde71edbf8d746aa3837ad6536e5f7091cd519a091cbcee')
sha256sums_armv7h=('1d674aded6ace0d2c7680b525ebae08c294f91fe01e5c6fe6968c9b99827e856'
                   '2a548240db437e6c025897745b0e1d0f27c5ecf2bbe83d22086bc2fc344b9545')
sha256sums_i686=('3d23a29b22cc914b814b60ee48f7e2ca27868276ab93f29d204a561af68f0e65'
                 'a772d270b4cb3646ef9ab85db4ca1681260bbfd00797f956fd17d97b0f828a5d')
sha256sums_powerpc64le=('caca529e9a672e219b1e24273bbb27917091077da3740cee4930a95c48ea2378'
                        'c60d66764cf0cc9de438f7605859850e2ffbe8e72a4d1e6258f624ade9d4ab7e')
sha256sums_riscv64=('d18da4e22081e4b532455d355e4050b9bc2268fb12d281d0885b067d1feee66d'
                    '23f670d862832bb41d80b0448f15242543c514127ada71586269446b5d9361cf')
sha256sums_x86_64=('9f58916db9cca5efeb7c0c693a55d327cc9169a78a4919ea9ad1ba959373af89'
                   '0a2531a293d1cd88d63ed66a905826c1910c3280969446dc6634e85f51930363')

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
