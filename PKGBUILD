# Maintainer: Hai Zhang <dreaming.in.code.zh@gmail.com>

_pkgname=fprint_demo
pkgname="${_pkgname}-git"
pkgver=0.4.r6.g5d86c3f
pkgrel=1
pkgdesc='A simple GTK+ application to demonstrate and test libfprint'"'"'s capabilities'
arch=('i686' 'x86_64')
url='https://www.freedesktop.org/wiki/Software/fprint/fprint_demo/'
license=('GPL2')
depends=('gtk2' 'libfprint')
makedepends=(git)
groups=(fprint-git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/dsd/fprint_demo.git')
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure --prefix=/usr \
              --sysconfdir=/etc
  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
