# Maintainer: 4679kun <4679kun@outlook.com>

pkgname=chann-git
pkgver=20151229
pkgrel=1
pkgdesc="Chann is an anonymous imageboard written in C/C++ based on mongoose and unqlite."
arch=('i686' 'x86_64')
url="http://chann.org/"
license=('GPL3')
depends=('glibc' 'curl')
makedepends=('git')
conflicts=('chann')
backup=(etc/chann/chann.conf)
source=('git+https://github.com/coyove/chann.git'
	"chann.service"
	"startchann"
)
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/chann"
  git log -1 --format="%cd" --date=short | sed 's|-||g'
}

build() {
  cd "${srcdir}/chann"
  mkdir build
  make
}

package() {
  cd "${srcdir}/chann"
  install -D -m644 "${srcdir}/chann.service" "${pkgdir}/usr/lib/systemd/system/chann.service"
  install -D -m644 "${srcdir}/chann/chann_test.conf" "${pkgdir}/etc/chann/chann.conf"
  install -D -m755 "${srcdir}/chann/chann" "${pkgdir}/usr/bin/chann"
  install -D -m755 "${srcdir}/startchann" "${pkgdir}/usr/bin/startchann"
  install -D -m755 -d "${srcdir}/chann/assets" "${pkgdir}/etc/chann/assets"
  install -D -m755 -d "${srcdir}/chann/templates" "${pkgdir}/etc/chann/templates"
}
