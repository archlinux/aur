# Maintainer: Wes Barnett <wes AT w barnett DOT us>
pkgname=dcdfort
pkgver=1.3
pkgrel=1
pkgdesc="Modern Fortran toolkit for reading in and analyzing DCD simulation trajectories from LAMMPS"
arch=(any)
url="https://github.com/wesbarnett/dcdfort"
license=('GPL')
depends=('gcc-fortran')
makedepends=('meson')
source=(https://github.com/wesbarnett/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('75199f301aebd725bb3e4f46cc133caaf0d552d1f002a7de34d3f30e6032b572cd4cf472d72386dbc4350155fd6f338960eb35a6d7d7f1f5d57cd6b08ab0c639')

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
