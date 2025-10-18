# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="ondk"
_pkgname="android-${_name}"
pkgname="${_pkgname}-bin"
pkgver=r29.2
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
sha256sums_x86_64=('ad97b965f91ab6ff796bbf43227bf18420a49b87c069d39b61bcdc496ba78494')
b2sums_x86_64=('3d619d665c72cc59ca4d68402d6ca00b9e96a12d29d45949245c34d0f389660e18a2827ae66fe045221d7d3a05b0cecb96e86907ee108319719d0449a752ce72')

package() {
  cd "${srcdir}"
  # install -vDm644 "${_pkgname}."{csh,sh} -t "${pkgdir}/etc/profile.d"
  
  install -vd "${pkgdir}/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/android-sdk/ndk"
  cp -aT --no-preserve=ownership "${_name}-${pkgver}" "${pkgdir}/opt/${_pkgname}-${pkgver}"
  ln -vsf "/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  ln -vsf "/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/android-sdk/ndk/magisk"
}
