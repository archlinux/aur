# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="ondk"
_pkgname="android-${_name}"
pkgname="${_pkgname}-bin"
pkgver=r29.6
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
sha256sums_x86_64=('4217061bf81da89681a557fcb93b49bcc36ae5ae5cc4a9d2944d54e4cadd2a1d')
b2sums_x86_64=('5fa0f1148a70653bef33a90c2319fe19245cacaa09ea3c44efd4687cb5c321e4fa8e2ea272a39627f8a66e59f8bfd82340213b46ce1d298cb106db5d568d544e')

package() {
  cd "${srcdir}"
  # install -vDm644 "${_pkgname}."{csh,sh} -t "${pkgdir}/etc/profile.d"
  
  install -vd "${pkgdir}/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/android-sdk/ndk"
  cp -aT --no-preserve=ownership "${_name}-${pkgver}" "${pkgdir}/opt/${_pkgname}-${pkgver}"
  ln -vsf "/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/${_pkgname}"
  ln -vsf "/opt/${_pkgname}-${pkgver}" "${pkgdir}/opt/android-sdk/ndk/magisk"
}
