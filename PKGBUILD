# Original Contributor Dan McGee <dan@archlinux.org>
# Contributor: Florian Zeitz <florob at babelmonkeys dot de>
# Mantainer:  Lorenzo Ferrillo <lorenzofer at live dot it> 
_basename=numactl
pkgname=lib32-numactl
pkgver=2.0.11
pkgrel=1
pkgdesc="Simple NUMA policy support 32-bit version. Libraries only"
arch=('x86_64')
url="http://oss.sgi.com/projects/libnuma/"
license=('LGPL2.1' 'GPL2')
depends=('perl' 'numactl')
source=(ftp://oss.sgi.com/www/projects/libnuma/download/$_basename-${pkgver/_/-}.tar.gz)
md5sums=('d3bc88b7ddb9f06d60898f4816ae9127')
sha1sums=('0846670269824078a4eae8a977728175437b0da4')

build() {
  export CC="$CC -m32"
  export CXX="$CXX -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/$_basename-${pkgver/_/-}"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/$_basename-${pkgver/_/-}"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/share/" "$pkgdir/usr/bin/" "$pkgdir/usr/include/"
}
 
