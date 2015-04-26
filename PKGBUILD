# Maintainer: Thermi <noel [at] familie-kuntze dot com>

pkgname=softflowd
pkgver=0.9.9
pkgrel=1
pkgdesc="open source netflow probe"
url='http://www.mindrot.org/projects/softflowd/'
license=("BSD")
arch=('i686' 'x86_64')
depends=('automake')

source=("https://github.com/Thermi/softflowd/archive/softflowd-${pkgver}.tar.gz")

sha256sums=('835a52c641e2e4bfc3afae0f5c667ad69d0af35fded4ff4d20ea2904f8b6cad2')

prepare() {
	cd ${srcdir}/softflowd-softflowd-${pkgver}
	touch config.h.in
	autoreconf
	
}
build() {
  cd ${srcdir}/softflowd-softflowd-${pkgver}/

  ./configure --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib
  make
}

package() {
  cd "${srcdir}/softflowd-softflowd-${pkgver}"
  make DESTDIR=${pkgdir} install
}
