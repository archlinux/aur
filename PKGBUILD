# Maintainer: deko <https://aur.archlinux.org/account/deko/>
pkgname=cpgcdemux
pkgver=0.1
pkgrel=1
pkgdesc="Linux console port of PgcDemux. A tool for demuxing a DVD PGC/VID/CELL."
arch=('x86_64')
url='http://cdslow.org.ru/en/cpgcdemux'
license=('LGPL')
depends=('gcc-libs')
makedepends=('cmake')
provides=('cpgcd')
source=("http://cdslow.org.ru/files/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('88f3cd39ef52515f512a17c19eb8fd48be3dbe56d1745d3a5aec2a8158854e2b')

build() {
    export CXXFLAGS+=" ${CPPFLAGS}"
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir/" install
    install -D -m644 "$pkgname-$pkgver/lgpl-2.1.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
