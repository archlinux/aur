# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=faac
pkgname=lib32-$_pkgname
pkgver=1.29.9.2
pkgrel=1
pkgdesc="An AAC audio encoder (32 bit)"
arch=('x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom:FAAC')
depends=('lib32-libmp4v2' "$_pkgname")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('2b58d621fad8fda879f07b7cad8bfe10')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd ${_pkgname}-${pkgver}
  
./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32/${_pkgbase}
make
}

package() {
cd ${_pkgname}-${pkgver}
make DESTDIR="$pkgdir" install  
rm -rf "$pkgdir"/usr/{bin,include,share}
install -Dm644 "${srcdir}"/${_pkgname}-${pkgver}/COPYING "${pkgdir}"/usr/share/licenses/lib32-faac/LICENSE

install -dm755 "$pkgdir"/usr/share/licenses
ln -s $_pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}
