# Maintainer: Lutz Freitag <aur.lutz@gottliebtfreitag.de>

pkgname=simplyfile-git
pkgver=1.0
pkgrel=1
pkgdesc='C++ wrappers around linux file descriptors'
url='https://github.com/gottliebtfreitag/simplyfile'
arch=('any')
license=('MIT')
makedepends=('git' 'cmake')
provides=('simplyfile')
source=('git+https://github.com/gottliebtfreitag/simplyfile.git')
sha256sums=('SKIP')

pkgver() {
    git -C simplyfile describe --tags
}

build() {
    cmake -B simplyfile/build -S simplyfile \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -Wno-dev
    cmake --build simplyfile/build --target all
}

package() {
	cmake --build simplyfile/build --target install DESTDIR="$pkgdir"
    install -D -m644 simplyfile/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
