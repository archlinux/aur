# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=libmodplug
pkgname=lib32-${_pkgname}
pkgver=0.8.8.5
pkgrel=3
pkgdesc="A MOD playing library (32 bit)"
arch=('x86_64')
url="http://modplug-xmms.sourceforge.net/"
license=('custom')
depends=('lib32-gcc-libs' "${_pkgname}")
source=("http://downloads.sourceforge.net/modplug-xmms/${_pkgname}-${pkgver}.tar.gz")
md5sums=('5f30241db109d647781b784e62ddfaa1')


build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
 
cd "${_pkgname}-${pkgver}"
./configure --prefix=/usr --libdir=/usr/lib32
make
}

package() {
cd "${_pkgname}-${pkgver}"
make DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr/include"
mkdir -p "${pkgdir}/usr/share/licenses"
ln -s ${_pkgname} "${pkgdir}/usr/share/licenses/${pkgname}"

# Modify libmodplug.pc
cd "${pkgdir}/usr/lib32/pkgconfig"
sed -i 's|includedir=${prefix}/include|includedir=${prefix}/include/libmodplug/|' libmodplug.pc
}
