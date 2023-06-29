# Maintainer: Miroslav Koškár <https://mkoskar.com/>

_basename=libxinerama-randr

pkgname=libxinerama-randr-git
pkgver=1.1.4.r4.g95bc09e
pkgrel=1
pkgdesc='Fork of libXinerama using RANDR for it to work in Zaphod mode'
url=https://github.com/mkoskar/libxinerama-randr
license=(custom)
arch=(x86_64)

depends=(libxext xorgproto 'libxrandr>=1.5')
provides=(libxinerama)
conflicts=(libxinerama)
makedepends=(xorg-util-macros)

source=(git+https://github.com/mkoskar/"$_basename".git)
sha256sums=(SKIP)

pkgver() {
    cd "$_basename"
    git describe --long --tags |
        sed 's/libXinerama-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_basename"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "$_basename"
    make DESTDIR="$pkgdir" install
    install -D -m644 -t "$pkgdir/usr/share/licenses/$_basename" COPYING
}
