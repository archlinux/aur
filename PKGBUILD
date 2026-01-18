# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="libideviceactivation"
pkgver=1.1.1
pkgrel=1
pkgdesc="A library to handle the activation process of iOS devices"
arch=(
  'x86_64'
)
url="https://github.com/libimobiledevice/${pkgname}"
license=(
  'LGPL-2.1-or-later'
  'GPL-3.0-or-later'
)
depends=(
  'curl>=7.20'
  'glibc'
  'libimobiledevice>=1.3.0'
  'libplist>=2.2.0'
  'libxml2>=2.9'
)
provides=(
  "${pkgname}-1.0.so"
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "${url}/releases/download/${pkgver}/${_pkgsrc}.tar.bz2"
)
sha256sums=('4dfb01068554e889d4fff78f4a7ab4e8d87819148d4e57a9dccbec51b8edc712')

build() {
  local configure_options=(
    --prefix='/usr'
  )
  
  cd "${srcdir}/${_pkgsrc}"
  autoreconf -vfi
  ./configure "${configure_options[@]}"
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  install -vDm644 "NEWS"        "${pkgdir}/usr/share/doc/${pkgname}/NEWS"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -vDm644 "COPYING"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
