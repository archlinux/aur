# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgbase=faac
pkgname=lib32-$_pkgbase
pkgver=1.29.3
pkgrel=1
pkgdesc="An AAC audio encoder (32 bit)"
arch=('x86_64')
url="http://www.audiocoding.com/"
license=('GPL' 'custom:FAAC')
depends=('lib32-libmp4v2' "$_pkgbase")
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/$_pkgbase/$_pkgbase-$pkgver.tar.gz")
md5sums=('20108ccff238813937ae1fec6eb80e7c')

prepare() {
cd $_pkgbase-$pkgver
./bootstrap
}

build() {
export CC='gcc -m32'
export CXX='g++ -m32'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  
cd $_pkgbase-$pkgver
  
./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32/$_pkgbase
make
}

package() {
cd $_pkgbase-$pkgver
make DESTDIR="$pkgdir" install  
rm -rf "$pkgdir"/usr/{bin,include,share}
install -dm755 "$pkgdir"/usr/share/licenses
ln -s $_pkgbase "$pkgdir"/usr/share/licenses/$pkgname
}
