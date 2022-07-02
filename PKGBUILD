# Maintainer: Szymon Januszek <szymon_j at tutanota dot com>

pkgname=sio2jail
pkgver=v1.4.3
pkgrel=1

pkgdesc="A tool for supervising execution of programs submitted in Polish national algorithmic competitions"
url="https://github.com/sio2project/sio2jail"

arch=(x86_64)
license=('MIT')

depends=('libseccomp')
makedepends=('git' 'libcap' 'tclap' 'gcc-libs' 'lib32-glibc' 'scdoc')

provides=(sio2jail)

source=("${pkgname}_${pkgver}::git+https://github.com/sio2project/sio2jail.git#tag=${pkgver}")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}_${pkgver}"
    mkdir build && cd build
    cmake -Wno-dev -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" -DLINK=DYNAMIC -DWITH_DOCS=YES ..
    make
}

package() {
    cd "${srcdir}/${pkgname}_${pkgver}"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    cd build
    make install

#    mkdir "$pkgdir/usr/share/man/man1"
#    mv "$pkgdir/usr/share/man/sio2jail.1" "$pkgdir/usr/share/man/man1/sio2jail.1"
}
