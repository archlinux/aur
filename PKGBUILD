# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=libdvdnav
pkgname=lib32-${_pkgname}
pkgver=5.0.3
pkgrel=2
pkgdesc="The library for xine-dvdnav plugin (32 bit)"
arch=('x86_64')
license=('GPL')
url="http://dvdnav.mplayerhq.hu/"
depends=('lib32-libdvdread' "${_pkgname}")
makedepends=('git')
#source=(git://git.videolan.org/libdvdnav.git#tag=$pkgver
#	fix-crash-describe_title.patch)
source=("$_pkgname-$pkgver.zip::https://code.videolan.org/videolan/libdvdnav/repository/archive.zip?ref=$pkgver"
	fix-crash-describe_title.patch)
md5sums=('7d7713909dc8642550ef3f2e661e2e52'
         'a23f89f9175a36f04b5e202bd4e35baa')



#md5sums=('SKIP'
#         'a23f89f9175a36f04b5e202bd4e35baa')
#source=("http://mirror.us.leaseweb.net/archlinux/extra/os/i686/${_pkgname}-${pkgver}-1-x86_64.pkg.tar.xz")
#md5sums=('8e673c2641a6d53ff3d5bde0b7a164eb')

prepare() {
#cd "${_pkgname}"

cd $_pkgname-$pkgver-5fb919774444aa382f6e02cb63801c82f2c38325
patch -Np1 -i ../fix-crash-describe_title.patch
autoreconf -fi
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
#cd "${_pkgname}"  
cd $_pkgname-$pkgver-5fb919774444aa382f6e02cb63801c82f2c38325
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
#cd "${_pkgname}"
cd $_pkgname-$pkgver-5fb919774444aa382f6e02cb63801c82f2c38325
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}

