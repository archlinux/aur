# Maintainer: blackleg <blackleg@openmailbox.org>

pkgname=kalibrate-rtl-git
pkgver=aae11c8
pkgrel=1
pkgdesc='Fork of http://thre.at/kalibrate/ for use with rtl-sdr devices'
arch=('i686' 'x86_64')
license=('GPL')
url='https://github.com/steve-m/kalibrate-rtl'
provides=('kalibrate-rtl')
depends=("rtl-sdr")
makedepends=('git')
source=("${pkgname}::git+https://github.com/steve-m/kalibrate-rtl")
md5sums=('SKIP')


pkgver () {
  cd "${srcdir}/${pkgname}"
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "${srcdir}/${pkgname}"
	./bootstrap
	./configure --prefix=/usr
	make
  
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}
