# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=deduper-git
pkgver=r106.bda14d2
pkgrel=1
pkgdesc='Deduper finds you similar images on your local filesystem.'
arch=('x86_64' 'aarch64')
url='https://cgit.chrisoft.org/deduper.git/'
license=('MPL2.0')
conflicts=('qdeduper')
depends=(
    'qt5-base'
    'opencv'
)
makedepends=(
    'git'
    'qt5-tools'
    'cmake'
)
source=(
    'git+https://git.chrisoft.org/git/deduper.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/deduper

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/deduper
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    #make -C ${srcdir}/deduper DESTDIR="$pkgdir" install
    cd ${srcdir}/deduper
    #make INSTALL_ROOT="$pkgdir" install
    install -Dm755 ./qdeduper/qdeduper ${pkgdir}/usr/bin/qdeduper
    mkdir -p ${pkgdir}/usr/share/licenses/qdeduper
    install ./COPYING ${pkgdir}/usr/share/licenses/qdeduper/LICENSE
}
