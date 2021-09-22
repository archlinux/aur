# Maintainer: Dragoon Aethis <rk@dragonic.eu>

_reponame=DenoiseIt
pkgname=denoiseit-git
pkgver=20210922.36cc813
pkgrel=1
pkgdesc='Tiny utility to run audio files through RNNoise'
arch=('x86_64')
url='https://github.com/DragoonAethis/DenoiseIt'
license=('GPL-3.0')
depends=('rnnoise' 'libsndfile')
makedepends=('cmake')
source=("git+https://github.com/DragoonAethis/DenoiseIt.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_reponame}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
    cd "${srcdir}/${_reponame}"
    cmake \
        -B "build" \
        -DCMAKE_BUILD_TYPE:STRING='None' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr'
    make -C "build" all
}

package() {
    cd "${srcdir}/${_reponame}"
    make -C "build" DESTDIR="$pkgdir" install
    install -D -m644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
