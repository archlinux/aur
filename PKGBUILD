# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=dcdfort
pkgver=1.2
pkgrel=1
pkgdesc="Modern Fortran toolkit for reading in and analyzing DCD simulation trajectories from LAMMPS"
arch=(any)
url="https://github.com/wesbarnett/dcdfort"
license=('GPL')
depends=('gcc-fortran')
makedepends=('meson')
source=(https://github.com/wesbarnett/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('873d7c133d16a6f1dc598e641be05f0ff545c323cb9eaba48ac5bcf6e91dc36d7e927afc079ecbc525080bae13d8150c5350b915c01fa09ae0b05ef8379f86fc')

build() {
    meson --prefix=/usr "${srcdir}/${pkgname}-${pkgver}" builddir
    ninja -C builddir
}

check() {
    ninja -C builddir test
}

package() {
    DESTDIR="${pkgdir}" ninja -C builddir install
}
