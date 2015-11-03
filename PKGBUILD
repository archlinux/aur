# Maintainer: ThecaTTony <thecattony at gmx dot com>
# Contributer: <giacomogiorgianni at gmail dot com>

_pkgname=QuiteRSS
pkgname=quiterss
pkgver=0.18.2
pkgrel=3
pkgdesc="Fast and light RSS/Atom feed reader written on Qt/С++"
arch=('i686' 'x86_64')
url="http://quiterss.org/"
license=('GPL3')
depends=('qt5-multimedia' 'qt5-tools')
install=$pkgname.install
source=("http://quiterss.org/files/$pkgver/$_pkgname-$pkgver-src.tar.gz" "$pkgname.patch")
sha512sums=('ff441887de758f0cdbab32db7a3e730024261c058f487c3409a872554f1fee35ba62f2e7fbd91b0aacfcd09fbf2b1c33a18d96f4153c0c171ea458ac9099b44a'
            'f4d1d38ec51765ff11e2b7499f1388a5e5bf91463efcc09b629d801cae4a8224427d8525b8e9c22eedd4d9ecf03d17fd41edb81f925aaaa82fd483b12875f455')

prepare() {
cd "$srcdir"
patch -p1 -i "$pkgname".patch
}

build() {
cd "$srcdir"
qmake-qt5 "$srcdir/$_pkgname.pro" \
  PREFIX=/usr \
  CONFIG+=LINUX_INTEGRATED \
  DISABLE_PHONON=1 \
  INSTALL_ROOT_PATH="$pkgdir"
make
}
package() {
cd "$srcdir"
make INSTALL_ROOT="$pkgdir" install
}
