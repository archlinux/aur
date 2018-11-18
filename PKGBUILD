# Contributor: Ionut Biru <ionut@archlinux.ro>
# Contributor: WAntilles <wantilles@adslgr.com>
# Maintainer: GordonGR <gordongr@freemail.gr>

pkgname=lib32-opencore-amr
_pkgname=opencore-amr
pkgver=0.1.5
pkgrel=2
pkgdesc="Open source implementation of the Adaptive Multi Rate (AMR) speech codec, lib32"
arch=('x86_64')
license=('APACHE')
url="http://opencore-amr.sourceforge.net/"
source=("http://downloads.sourceforge.net/sourceforge/$_pkgname/$_pkgname-$pkgver.tar.gz")
depends=("glibc" "$_pkgname")
md5sums=('e0798587b91411cc092aa73091a97dfc')

build() {
export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

cd "$srcdir/$_pkgname-$pkgver"
./configure --prefix=/usr --disable-static --libdir=/usr/lib32 --libexecdir=/usr/lib32
make
}

package() {
cd "$srcdir/$_pkgname-$pkgver"
make DESTDIR="$pkgdir" install
cd "$pkgdir/usr"
rm -rf include/
}

