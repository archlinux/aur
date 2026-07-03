# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="zxspectrum-utils"
pkgver=1.2.2
pkgrel=2
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
  'libjpeg-turbo'
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
md5sums=('c202ae0df3c4a83aa304985bc36fca70')
sha1sums=('6317d64ebb22f842027da5d29c0814df2a5f93d2')
sha256sums=('75ba315fbb9851b96011af27acb572dd5c326c18e205ac0f55c40395c320c467')

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
