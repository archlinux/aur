# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="zxspectrum-utils"
pkgver=1.2.1
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
# makedepends=(
#   'svn'
# )
provides=(
  "bin2tap=${pkgver}"
)
conflicts=(
  'bin2tap'
)
replaces=(
  'bin2tap'
)
_pkgsrc="${pkgname}-${pkgver}"
# _pkgsrc="zxspectrumutils"
source=(
  "https://downloads.sourceforge.net/zxspectrumutils/files/${_pkgsrc}.tar.gz"
  # "${_pkgsrc}::svn+https://svn.code.sf.net/p/zxspectrumutils/code/trunk#revision=82"
)
md5sums=('6a28755ac988366db447bb1c95b0dad5')
sha1sums=('2b897aa442b43b8d185d503057ac322f172ccf29')
sha256sums=('0077815cf4f0774175a8cd2fb42468edcdf36b77c1b9f464138919750ada8ac5')

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
