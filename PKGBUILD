# Maintainer: GordonGR <ntheo1979@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Contributor: quequotion <quequotion@gmail.com>

_pkgname=spandsp
pkgname=lib32-$_pkgname
pkgver=0.0.6
pkgrel=2
pkgdesc="A DSP library for telephony (32 bit)"
arch=(x86_64)
license=('GPL')
url="http://www.soft-switch.org/"
depends=('lib32-libtiff' "$_pkgname")
source=("http://www.soft-switch.org/downloads/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('16bb215ca89a39282e832403f69bc4c98ad3fe35ab3a6eb4731ee5029a6acd9b2df243c3701de845441cbdc16c88b3cd398ef15dc3502e45d5aeca8a161917d4')

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export LDFLAGS='-m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
cd $_pkgname-0.0.6
./configure --prefix=/usr --libdir=/usr/lib32 --host=i686-unknown-linux-gnu
make
}

package() {
cd $_pkgname-0.0.6
make DESTDIR="$pkgdir" install
rm -rf "$pkgdir"/usr/include
}

