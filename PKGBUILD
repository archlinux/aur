# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="ondk"
_pkgname="android-${_name}"
pkgname="${_pkgname}-bin"
pkgver=r29.3
pkgrel=1
pkgdesc="Oxidized NDK - NDK repackaged with Rust toolchain"
arch=('x86_64')
url="https://github.com/topjohnwu/${_name}"
license=('Apache-2.0')
depends=(
  'bash'
  'gcc-libs'
  'glibc'
  'zlib'
)
optdepends=(
  'ncurses5-compat-libs: for curses module in bundled Python'
  'bzip2: for bz2 module in bundled Python'
  'libxcrypt-compat: for crypt module in bundled Python'
  'python: various helper scripts'
  'perl: various helper scripts'
  'libc++: for some LLVM components'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-${pkgver}"
)
options=(
  '!strip'
  '!debug'
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux.tar.xz")
sha256sums_x86_64=('8a31e125032e915c64fb764fb62d3086adcdc985570ea1ea91a010711e96f769')
b2sums_x86_64=('a4e8f35e3c61adc6a7a4604f200631774edbe91c233fb111998aa6c03dba860800d5014e9e127b015277bcecd06660ab00a97b9a7173fcec16e9391a9b186a3d')

package() {
  cd "${srcdir}"
  # install -vDm644 "${_pkgname}."{csh,sh} -t "${pkgdir}/etc/profile.d"
  
  install -vd "${pkgdir}/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/android-sdk/ndk"
  cp -aT --no-preserve=ownership "${_name}-${pkgver}" "${pkgdir}/opt/${_pkgname}-${pkgver}"
  ln -vsf "/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  ln -vsf "/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/android-sdk/ndk/magisk"
}
