# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# NOTE:
# libmfx defaults to build only the static library.

pkgname=libmfx
pkgver=1.21
pkgrel=1
pkgdesc='Intel Media SDK dispatcher library'
arch=('i686' 'x86_64')
url='https://github.com/lu-zero/mfx_dispatch/'
license=('BSD')
makedepends=('libva')
conflicts=('libmfx-git')
options=('staticlibs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/lu-zero/mfx_dispatch/archive/${pkgver}.tar.gz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('1ab803892193d4e8e3b0f5911e8612010a7fdfa8ff0a5c9f2b1aa534af87d41b')

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    cd "${pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.tar.gz" -s'|[^/]*/||'
}

build() {
    cd "${pkgname}-${pkgver}"
    autoreconf -i
    ./configure \
        --prefix='/usr' \
        --enable-static='yes' \
        --enable-shared='no' \
        --enable-fast-install='yes' \
        --with-libva_drm='yes' \
        --with-libva_x11='yes' \
        --with-pic
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
