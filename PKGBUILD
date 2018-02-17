# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=libdvdnav
pkgname=lib32-${_pkgname}
pkgver=6.0.0
pkgrel=1
pkgdesc="The library for xine-dvdnav plugin (32 bit)"
arch=('x86_64')
license=('GPL')
url="https://www.videolan.org/developers/libdvdnav.html"
depends=('lib32-libdvdread' "${_pkgname}")
makedepends=('git')
_commit=dcb9109e45ccd304ec82a7c7bf46cca63620adf9  # tags/6.0.0^0
source=("git+https://code.videolan.org/videolan/libdvdnav.git#commit=$_commit")
md5sums=('SKIP')

pkgver() {
cd ${_pkgname}
git describe --tags | sed -e 's/-/+/g'
}
prepare() {
cd "${_pkgname}"
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

