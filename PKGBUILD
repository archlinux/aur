# Maintainer: Samuel Balula sbalula@ethz.ch
# Intructions/ Troubleshoot
# Download the source from http://www.hsl.rl.ac.uk/ and place it in the folder, replacing the empty placeholder file
# Check the sha256sum of the downloaded tarball, it may be different from the one listed here. If so either use "SKIP"
# or replace with your tarball sha256sum

# A user has reported that "--prefix=/usr" was needed with "./configure" such that IPopt could recognize the installation. That was not the case for me.

pkgname=coin-or-hsl
_pkgname=coinhsl
pkgrel=1
pkgver=2019.05.21
pkgdesc="HSL Mathematical Software Library. Including solvers for sparse linear systems of equations and sparse eigenvalue problems. Compiled with coin-or-tools, supports Ipopt."
arch=('i686' 'x86_64')
url="http://www.hsl.rl.ac.uk/"
makedepends=('gcc' 'metis' 'gcc-fortran')
depends=()
optdepends=('openmp' 'coin-or-ipopt')
source=("ThirdParty-HSL::git+https://github.com/coin-or-tools/ThirdParty-HSL.git" "manual://${_pkgname}-${pkgver}.tar.gz")
sha256sums=("SKIP" "95ce1160f0b013151a3e25d40337775c760a8f3a79d801a1d190598bf4e4c0c3")

build() {
  cd $srcdir/ThirdParty-HSL
  ln -sf ../${_pkgname}-${pkgver} coinhsl
  ./configure
  #./configure --prefix=/usr
  make DESTDIR=$pkgdir
}

package ()
{
  cd $srcdir/ThirdParty-HSL
  make DESTDIR=$pkgdir install

  #For Ipopt:
  ln -rs $pkgdir/usr/local/lib/libcoinhsl.so $pkgdir/usr/local/lib/libhsl.so 
}	
