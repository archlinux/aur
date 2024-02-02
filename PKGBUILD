# Maintainer: acd407 <acd407@qq.com>

pkgname=sakura-acd407
_pkgname=sakura
pkgver=r945.d00621c
pkgrel=1
pkgdesc='A terminal emulator (with acd407 color patch)'
arch=('x86_64')
url='https://launchpad.net/sakura'
license=('GPL')
depends=('vte3' 'libxft')
makedepends=('git' 'cmake')
conflicts=('sakura')
source=("${pkgname}"::'git+https://github.com/dabisu/sakura.git'
        "sakura.c.patch")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${pkgname}
	patch "src/sakura.c" < ../sakura.c.patch
    mkdir build && cd build
    cmake .. \
        -G 'Unix Makefiles' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    make DESTDIR=${pkgdir} install
}
