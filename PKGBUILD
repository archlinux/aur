# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=sbc
pkgname="lib32-$_basename"
pkgver=1.3
pkgrel=2
pkgdesc="Bluetooth Subband Codec (SBC) library (32-bit)"
arch=('x86_64')
url="http://www.bluez.org/"
license=('GPL' 'LGPL')
depends=('lib32-glibc' 'sbc')
source=(http://www.kernel.org/pub/linux/bluetooth/$_basename-$pkgver.tar.xz)
sha512sums=('c11cb1ede8abdb226d404ce34307d217b716b91cbe550ed90cb5387b062b7b97a6b7a81371de6f462d8c1429cb3299869a1bda347fa175e9d81cfa2bc2056c8b')

build() {
    cd $_basename-$pkgver

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure --prefix=/usr \
        --build=i686-pc-linux-gnu \
        --libdir=/usr/lib32 \
        --disable-static \
        --disable-tester

    make
}

package() {
    cd $_basename-$pkgver

    make DESTDIR="$pkgdir" install

    cd "$pkgdir"/usr

    rm -r bin include
}
