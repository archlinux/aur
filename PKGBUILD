# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="ondk"
_pkgname="android-${_name}"
pkgname="${_pkgname}-bin"
pkgver=r30.0
pkgrel=1
pkgdesc="Oxidized NDK - NDK repackaged with Rust toolchain"
arch=(
  'x86_64'
)
url="https://github.com/topjohnwu/${_name}"
license=(
  'Apache-2.0'
)
depends=(
  'bash'
  'glibc'
  'libgcc'
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
source_x86_64=(
  "${_pkgname}-${pkgver}-x86_64.tar.xz::${url}/releases/download/${pkgver}/${_name}-${pkgver}-linux.tar.xz"
)
sha256sums_x86_64=('3492ef0077a455a59ffc00f5cd71c4ba83ac04c15fdf58e22f280aa45310eeef')
b2sums_x86_64=('f00d26cc153a65e5db4e28fd6eda01a5b4ff9135e5762cb149e98d1de52516fca3888a9be7a1cdfc453d0b829b151a00cb87d98a1948e9a98d8e7686c902cef0')

package() {
  cd "${srcdir}"
  # install -vDm644 "${_pkgname}."{csh,sh} -t "${pkgdir}/etc/profile.d"
  
  install -vd "${pkgdir}/opt/${_pkgname}" "${pkgdir}/opt/android-sdk/ndk"
  cp -aT --no-preserve=ownership "${_name}-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  ln -vsf "/opt/${_pkgname}" "${pkgdir}/opt/${_pkgname}-${pkgver}"
  ln -vsf "/opt/${_pkgname}" "${pkgdir}/opt/android-sdk/ndk/magisk"
}
