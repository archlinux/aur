# Maintainer:  dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: kusakata (https://aur.archlinux.org/account/kusakata)

pkgname=libzc
pkgver=0.4.3
pkgrel=2
pkgdesc="Tool and library for cracking zip files"
url="https://github.com/mferland/libzc"
license=('GPL-3.0-or-later')
arch=('x86_64')
depends=(
  'gcc-libs'
  'glibc'
  'zlib'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mferland/libzc/archive/v${pkgver}.tar.gz")
sha256sums=('2c426bf5578b5ea5014ee0f75e52698ec648d426f8983b090342b566dcebf15b')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./autogen.sh
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
 
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --enable-year2038
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
