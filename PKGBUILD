# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="zxspectrum-utils"
pkgver=1.2.2
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
md5sums=('1b9380456ef1d2f0979d6c2d6f6c62c3')
sha1sums=('846294f0f6be9b03b776b2f52bc5c23b66084772')
sha256sums=('3d9209d481bd51e6886cf4b3a682e31f82cae553cbf04d20f6be26a33e55702b')

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
