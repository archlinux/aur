# Maintainer: Juanjo Gutierrez

# based on PKGBUILD for util-linux by:
# Maintainer: Tom Gundersen <teg@jklm.no>
# Maintainer: Dave Reisner <dreisner@archlinux.org>
# Contributor: judd <jvinet@zeroflux.org>

pkgname=fdformat
_pkgmajor=2.38
_realver=${_pkgmajor}.1
pkgver=${_realver/-/}
pkgrel=1
pkgdesc='fdformat from util-linux'
url='https://github.com/karelzak/util-linux'
arch=('x86_64')
makedepends=()
license=('GPL2')
validpgpkeys=('B0C64D14301CC6EFAEDF60E4E4B71D5EEC39C284')  # Karel Zak
source=("https://www.kernel.org/pub/linux/utils/util-linux/v${_pkgmajor}/util-linux-${_realver}.tar."{xz,sign})
sha256sums=('60492a19b44e6cf9a3ddff68325b333b8b52b6c59ce3ebd6a0ecaa4c5117e84f'
            'SKIP')

build() {
  cd "util-linux-${_realver}"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --localstatedir=/var \
    --disable-all-programs \
    --enable-fdformat

  make
}

package() {
  cd "util-linux-${_realver}"

  make DESTDIR="${pkgdir}" usrsbin_execdir=/usr/bin install

  ### locales are shipped as part of util-linux-libs
  rm -fr "${pkgdir}"/usr/share/locale

  ### common man pages already installed by util-linux
  rm -fr "${pkgdir}/usr/share/man/man1"
  rm -fr "${pkgdir}/usr/share/man/man3"
  rm -fr "${pkgdir}/usr/share/man/man5"
}
