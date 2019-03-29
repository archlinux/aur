# Maintainer: Rodrigo Bezerra <rodrigobezerra21 at gmail dot com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>
# Contributor: GordonGR <ntheo1979@gmail.com>

_basename=faac
pkgname=lib32-faac
pkgver=1.29.9.2
pkgrel=2
pkgdesc="An AAC audio encoder (32 bit)"
arch=(x86_64)
url="http://www.audiocoding.com/"
license=('GPL2' 'custom:FAAC')
depends=(lib32-glibc faac)
source=("http://downloads.sourceforge.net/${_basename}/${_basename}-${pkgver}.tar.gz")
sha256sums=('d45f209d837c49dae6deebcdd87b8cc3b04ea290880358faecf5e7737740c771')

build() {
    cd ${_basename}-${pkgver}

    export CC='gcc -m32'
    export CXX='g++ -m32'
    export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

    ./configure \
        --build=i686-pc-linux-gnu \
        --prefix=/usr \
        --libdir=/usr/lib32

    make
}

package() {
    cd ${_basename}-${pkgver}

    make DESTDIR="$pkgdir" install

    rm -rf "$pkgdir"/usr/{bin,include,share}

    install -Dm644 README "${pkgdir}"/usr/share/licenses/lib32-faac/LICENSE
}
