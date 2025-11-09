# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: redponike <proton (dot) me>
# Contributor: Nicholas Schlabach <Techcable at techcable dot net>

_pkgname="zls"
pkgname="${_pkgname}-bin"
pkgver=0.15.0
pkgrel=1
pkgdesc="A language server for Zig"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'loong64'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://zigtools.org/zls"
license=(
  'MIT'
)
depends=(
  "zig>=${pkgver%.*}"
)
makedepends=(
  'minisign'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=("https://builds.zigtools.org/${_pkgname}-aarch64-linux-${pkgver}.tar.xz"
                "https://builds.zigtools.org/${_pkgname}-aarch64-linux-${pkgver}.tar.xz.minisig")
source_armv7h=("https://builds.zigtools.org/${_pkgname}-arm-linux-${pkgver}.tar.xz"
               "https://builds.zigtools.org/${_pkgname}-arm-linux-${pkgver}.tar.xz.minisig")
source_i686=("https://builds.zigtools.org/${_pkgname}-x86-linux-${pkgver}.tar.xz"
             "https://builds.zigtools.org/${_pkgname}-x86-linux-${pkgver}.tar.xz.minisig")
source_loong64=("https://builds.zigtools.org/${_pkgname}-loongarch64-linux-${pkgver}.tar.xz"
                "https://builds.zigtools.org/${_pkgname}-loongarch64-linux-${pkgver}.tar.xz.minisig")
source_powerpc64le=("https://builds.zigtools.org/${_pkgname}-powerpc64le-linux-${pkgver}.tar.xz"
                    "https://builds.zigtools.org/${_pkgname}-powerpc64le-linux-${pkgver}.tar.xz.minisig")
source_riscv64=("https://builds.zigtools.org/${_pkgname}-riscv64-linux-${pkgver}.tar.xz"
                "https://builds.zigtools.org/${_pkgname}-riscv64-linux-${pkgver}.tar.xz.minisig")
source_x86_64=("https://builds.zigtools.org/${_pkgname}-x86_64-linux-${pkgver}.tar.xz"
               "https://builds.zigtools.org/${_pkgname}-x86_64-linux-${pkgver}.tar.xz.minisig")
sha256sums_aarch64=('2d1c91382dbbd7a34c3bd87da506e3c2ce6e6582612c2b371f7f97b46c5557d4'
                    'SKIP')
sha256sums_armv7h=('bcd86dc7d627c05ce4e1d212f2d88866af69a687b7cef5fbbf4f78d18e4f4d34'
                   'SKIP')
sha256sums_i686=('a213e54be1e5aabf28a60fb55072f8d024a1b3d3a1ff2d6cf7132ba78db0892c'
                 'SKIP')
sha256sums_loong64=('ef13b90ccbf3ced990a648c99c4343230e80ff9444839afc94216c9cc2994d05'
                    'SKIP')
sha256sums_powerpc64le=('67540b2fa539176b8f7cd1493f3b9da2518bd5028feebbab619dc40841a9a25d'
                        'SKIP')
sha256sums_riscv64=('4c3331846935ce442c51131e9e4a56bba1a4d28e149da211870b15a4b342baea'
                    'SKIP')
sha256sums_x86_64=('508bfe3fd637d2a02f07f3fc7da8900351f407116b03685c5dae26b4f01a30de'
                   'SKIP')

verify() {
  # https://github.com/zigtools/zls/releases/latest
  local zls_minisign="RWR+9B91GBZ0zOjh6Lr17+zKf5BoSuFvrx2xSeDE57uIYvnKBGmMjOex"
  local source_carch="source_${CARCH}[0]"
  local source_arch="${!source_carch}"
  local source_artifact="${source_arch##*/}"

  minisign -V \
    -P "${zls_minisign}" \
    -m "${source_artifact}"
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
