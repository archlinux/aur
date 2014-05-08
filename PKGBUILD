# Maintainer: Steve Ponsford <stvnpnsfrd@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Thayer Williams <thayer@archlinux.org>
# Contributor: gnud <gnud@gawab.com> 

pkgname=bbdock
pkgver=0.2.9
pkgrel=3
pkgdesc="An application launcher dockapp supporting PNG files and transparency"
arch=('i686' 'x86_64')
url="http://bbdock.nethence.com/"
license=('BSD')
depends=('libx11' 'libpng12' 'gcc-libs')
makedepends=('libxt')
changelog=ChangeLog
source=("http://bbdock.nethence.com/download/${pkgname}-${pkgver}.tar.gz"
	libpng12.patch)
md5sums=('58c19526f5c425c9a9f0f09d191a83b0'
         'f33fd591743da8fab5cd74992ee00cb1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 <"${srcdir}/libpng12.patch"

  ./configure CPPFLAGS="-I/usr/include/libpng12 $CPPFLAGS" --prefix=/usr
  make || return 1
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
  install -Dm655 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
