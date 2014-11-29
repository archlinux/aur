# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=detox
pkgver=1.2.0
pkgrel=2
pkgdesc="An utility designed to clean up filenames by replacing characters with standard equivalents"
arch=('i686' 'x86_64')
url="http://detox.sourceforge.net/"
license=('BSD')
makedepends=('flex')
options=('!makeflags')
backup=('etc/detox/detoxrc')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2
        http://sourceforge.net/p/detox/patches/_discuss/thread/02e5e473/ae23/attachment/detox-1.2.0.fix-invalid-memory-access.patch)
md5sums=('da34c6bc3c68ce2fb008e25066e72927'
         '98f2c7cf5610bd4568d6e0e75af505af')

prepare() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  patch -Np1 -i "${srcdir}"/detox-1.2.0.fix-invalid-memory-access.patch
}

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc/detox
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install

#license file
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
