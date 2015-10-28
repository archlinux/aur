# Maintainer: Faule Socke <github@socker.lepus.uberspace.de>
pkgname=frida
pkgver=0.2
pkgrel=1
pkgdesc="FrIDa is an interactive disassembler based on LLVM and Qt"
arch=(x86_64)
url="https://www.frida.xyz/"
license=('GPL3')
groups=()
depends=(gmock log4cxx llvm35 quazip-qt5 guile swig boost libedit)
makedepends=(cmake pkg-config)
replaces=()
backup=()
options=()
source=('https://www.frida.xyz/download/frida-0.2.txz'
        'frida.patch')
noextract=()
sha256sums=('SKIP'
            '852947bce88c1847b397806d5f13d69505eb8781f939de689f0eee976c8a7693')


prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    patch -p1 -i "$srcdir/${pkgname}.patch"
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQUAZIP_INCLUDE_DIR=/usr/include -DQUAZIP_LIBRARIES=/usr/lib/libquazip5.so
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir/" install
    mv "$pkgdir/usr/lib64" "$pkgdir/usr/lib"
}
