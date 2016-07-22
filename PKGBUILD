# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libdvdread
pkgname=lib32-${_pkgname}
pkgver=5.0.4
pkgrel=2
pkgdesc="Provides a simple foundation for reading DVD video disks (32 bit)"
arch=('x86_64')
url="http://dvdnav.mplayerhq.hu"
license=('GPL')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('lib32-libdvdcss' 'git')
options=('!libtool')
_gitver=511ac9c8199d7b604d6a65193fd2777b74fad776
#source=(git://git.videolan.org/libdvdread.git#commit=$_gitver)
#md5sums=('SKIP')
source=("$_pkgname-$pkgver.zip::https://code.videolan.org/videolan/libdvdread/repository/archive.zip?ref=$_gitver")
md5sums=('8afdef1868e1eb9fde8317bb2117af8c')

prepare() {
#cd $_pkgname
mv $_pkgname-$_gitver-$_gitver $_pkgname-$pkgver
cd $_pkgname-$pkgver

autoreconf -fi
}


build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
#cd "${_pkgname}"
cd $_pkgname-$pkgver
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
#cd "${_pkgname}"
cd $_pkgname-$pkgver
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}
