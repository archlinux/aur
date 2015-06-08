# Maintainer:  Tyler Veness <calcmogul at gmail dot com>
# Contributor: Alex Brinister <alex_brinister@yahoo.com>
pkgname=binutils-powerpc-wrs-vxworks
pkgver=2.25
pkgrel=2
pkgdesc="Binutils modded for VxWorks 6.3"
arch=('i686' 'x86_64')
url="http://firstforge.wpi.edu/sf/projects/c--11_toochain"
license=('GPL')
provides=('binutils-powerpc-wrs-vxworks')
conflicts=('vxworks-gcc-toolchain-bin')
depends=('binutils' 'wrs-vxworks-headers')
options=('!strip' '!libtool' '!zipman' '!buildflags' 'staticlibs')
source=(http://ftp.gnu.org/gnu/binutils/binutils-"$pkgver".tar.bz2)
sha512sums=('49438970642f379978aba988e3d2e7b63dab6fd0b46d91f4100f083e87a84d242089daca58572245fe620457a77bbbe2d78588ff3fb79314e500d1a39bf96f30')

build() {
  source /etc/profile.d/wind_base.sh
  cd $srcdir
  mkdir -p build && cd build
  ../binutils-$pkgver/configure \
    --prefix=/usr \
    --target=powerpc-wrs-vxworks \
    --disable-nls \
    --disable-libiberty-install \
    --enable-ld=default \
    --enable-gold \
    --enable-plugins \
    --disable-werror
  make || return 1
}
package(){
  cd $srcdir/build
  make DESTDIR=$pkgdir install || return 1
  rm -r $pkgdir/usr/share/info
}

# vim:set ts=2 sw=2
