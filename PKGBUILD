# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="waydroidsu"
pkgname="${_pkgname}-bin"
pkgver=0.1.2_1
_pkgver="${pkgver%_*}"
pkgrel=1
pkgdesc="CLI Magisk manager and installer for Waydroid written in Rust"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/mistrmochov/WaydroidSU"
depends=(
  'bzip2'
  'dbus'
  'glibc'
  # 'libcap' # ?
  'libgcc'
  'openssl'
  'systemd-libs'
  'xz'
)
license=(
  'GPL-3.0-or-later'
)
provides=(
  "${_pkgname}=${_pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${_pkgver}"
source=(
  "${_pkgsrc}-LICENSE.txt::${url}/raw/refs/tags/${_pkgver}/LICENSE.txt"
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/${_pkgver}/README.md"
)
source_aarch64=(
  "waydroidsu-${pkgver//_/-}-aarch64-archlinuxarm.pkg.tar.xz::${url}/releases/download/${_pkgver}/wsu-${pkgver//_/-}-aarch64-archlinuxarm.pkg.tar.xz"
)
source_x86_64=(
  "waydroidsu-${pkgver//_/-}-x86_64-archlinux.pkg.tar.zst::${url}/releases/download/${_pkgver}/wsu-${pkgver//_/-}-x86_64-archlinux.pkg.tar.zst"
)
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '8720aa94ac1c43acce9c67156816c4d514a885e6e3b72604d232c699198eb0cd')
sha256sums_aarch64=('a44350f0316b42dad0bbb2c1b67cc18c44f28c19a25ea5eb06f20b121a8aa1c0')
sha256sums_x86_64=('7552038967e62c0bf91bed3cbad399949bee0f1a4793ea3c96bc7759adf35084')

package() {
  cd "${srcdir}"
  install -vDm644 "${_pkgsrc}-LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
  install -vDm644 "${_pkgsrc}-README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"

  cd "usr/bin"
  install -vDm755 "wsu" "${pkgdir}/usr/bin/${_pkgname}"
  ln -vsf "${_pkgname}" "${pkgdir}/usr/bin/wsu"
}
