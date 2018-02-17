# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgname=libdvdread
pkgname=lib32-${_pkgname}
pkgver=6.0.0
pkgrel=1
pkgdesc="Provides a simple foundation for reading DVD video disks (32 bit)"
arch=('x86_64')
url="https://www.videolan.org/developers/libdvdnav.html"
license=('GPL')
depends=('lib32-glibc' "${_pkgname}")
makedepends=('lib32-libdvdcss' 'git')
options=('!libtool')
_commit=95fdbe8337d2ff31dcfb68f35f3e4441dc27d92f  # tags/6.0.0^0
source=("git+https://code.videolan.org/videolan/libdvdread.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
cd ${_pkgname}
git describe --tags | sed -e 's/-/+/g'
}

prepare() {
cd ${_pkgname}
autoreconf -fi
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd "${_pkgname}"
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd "${_pkgname}"
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,share}
}
