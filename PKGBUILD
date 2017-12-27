# Maintainer: Eduardo Sánchez Muñoz (eduardosm)
# Contributor: Sebastien Chassot (sinux) <seba.ptl@sinux.net>

pkgname=pothos
pkgver=0.6.0
pkgrel=2
pkgdesc="The Pothos data-flow framework"
arch=('i686' 'x86_64')
url="https://github.com/pothosware/PothosCore/wiki"
license=('boost')
depends=('python' 'poco' 'soapysdr-git' 'portaudio')
makedepends=('git' 'nlohmann-json')
source=("git+https://github.com/pothosware/PothosCore.git#tag=pothos-$pkgver")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir/PothosCore"
    git submodule update --init --recursive
}

build() {
    mkdir -p "$srcdir/pothos-build"
    cd "$srcdir/pothos-build"
    cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        "$srcdir/PothosCore"
    make
}

package() {
    cd "$srcdir/pothos-build"
    make DESTDIR="$pkgdir" install
}
