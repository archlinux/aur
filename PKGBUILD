# Maintainer: Lutz Freitag <aur.lutz@gottliebtfreitag.de>

pkgname=qrqma-git
pkgver=0.9.5.r0.c3488c1
pkgrel=1
pkgdesc='A C++ implementaion of Jinja templates'
url='https://github.com/nerdmaennchen/qrqma'
arch=('any')
license=('ISC')
makedepends=('git' 'cmake')
conflicts=('qrqma')
provides=('qrqma')
source=('git+https://github.com/nerdmaennchen/qrqma.git#tag=0.9.5')
sha256sums=('SKIP')

pkgver() {
    git -C qrqma describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
    cmake -B qrqma/build -S qrqma \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build qrqma/build --target all
}

package() {
	cmake --build qrqma/build --target install DESTDIR="$pkgdir"
    install -D -m644 qrqma/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
