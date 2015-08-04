# Maintainer : GordonGR <ntheo1979@gmail.com>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgname=libcroco
pkgname=lib32-$_pkgname
pkgver=0.6.8
pkgrel=2
pkgdesc="GNOME CSS2 parsing and manipulation toolkit"
arch=('x86_64')
url="http://www.gnome.org/"
license=('LGPL')
depends=("$_pkgname" 'lib32-glib2' 'lib32-libxml2')
makedepends=('gcc-multilib')
source=("http://ftp.gnome.org/pub/gnome/sources/$_pkgname/0.6/$_pkgname-$pkgver.tar.xz")
md5sums=('767e73c4174f75b99695d4530fd9bb80')

build() {
cd "$_pkgname-$pkgver"

export CC="gcc -m32"
export CXX="g++ -m32"
export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

./configure --prefix=/usr \
            --libdir=/usr/lib32 \
            --enable-static=no
make
}

package() {
cd "$_pkgname-$pkgver"
make DESTDIR="$pkgdir/" install

# rm unneeded files
rm -rf ${pkgdir}/usr/{bin,include,share}
}
