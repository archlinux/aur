# Maintainer: xpt <user.xpt@gmail.com>
pkgname=lammps  
pkgver=2Feb13
pkgrel=1 
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator."
url="http://lammps.sandia.gov/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('fftw' 'openmpi')
makedepends=()
source=(http://downloads.sourceforge.net/project/lammps/lammps-$pkgver.tar.gz
  fftw3.patch)
md5sums=('a948f8550c61178fcd88903d9da65b1b'
         '05eb4e2e9bd70ea62818d637875a5dfb')
build() {
  cd $srcdir/$pkgname-$pkgver
  patch -Np0 < ../fftw3.patch
  cd $srcdir/$pkgname-$pkgver/src
  # add whatever package you need in here.
  make yes-user-sph
  
  make openmpi || return 1
}

package() {
  mkdir -p $pkgdir/usr/share/lammps
  mkdir -p $pkgdir/usr/share/doc/lammps
  cd $srcdir/$pkgname-$pkgver
  install -Dm 755 src/lmp_openmpi $pkgdir/usr/bin/lmp_openmpi
  cp bench examples $pkgdir/usr/share/lammps -r
  cp doc/* $pkgdir/usr/share/doc/lammps -r
} 
