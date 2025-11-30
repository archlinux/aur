# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="zxspectrum-utils"
pkgver=1.1
pkgrel=1
pkgdesc="Package of utils for crossdevelopment for ZX Spectrum"
arch=(
  'x86_64'
)
url="https://sourceforge.net/projects/zxspectrumutils/"
license=(
  'GPL-2.0-or-later'
)
depends=(
  'glibc'
  'libjpeg'
  'libpng'
  'libx11'
)
_pkgsrc="${pkgname}-${pkgver}"
source=(
  "https://downloads.sourceforge.net/zxspectrumutils/files/${_pkgsrc}.tar.gz"
)
md5sums=('da141a0109b46bf862a6cd7a23aff82d')
sha1sums=('517d697baedc596168281ff0893e9e7670cc2243')
sha256sums=('5db4145083e5ee84cb67effd75e3fc6f602992a7f6273ff61500337981f77147')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
}

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

  cd "${pkgdir}/usr/share"
  install -vd "licenses/${pkgname}"
  mv -v "doc/${pkgname}/COPYING" "licenses/${pkgname}"
  rm -v "doc/${pkgname}/"{INSTALL,LICENCE}
}
