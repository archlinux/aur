# Maintainer: Lutz Freitag <aur.lutz@gottliebtfreitag.de>

pkgname=qrqma-git
pkgver=0.9.4
pkgrel=1
pkgdesc='A C++ implementaion of Jinja templates'
url='https://github.com/nerdmaennchen/qrqma'
arch=('any')
license=('ISC')
makedepends=('git' 'cmake')
provides=('qrqma')
source=("git+https://github.com/nerdmaennchen/qrqma.git#tag=0.9.4")
sha256sums=('SKIP')

pkgver() {
    cd qrqma
    git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
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
