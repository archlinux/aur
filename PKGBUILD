# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-tracker-player-git
pkgver=r55.b5faa0f
pkgrel=1
pkgdesc='A modular music player'
arch=('x86_64' 'aarch64')
url='https://github.com/BLumia/pineapple-tracker-player/'
license=('MIT')
conflicts=('pineapple-tracker-player')
depends=(
    'qt6-declarative'
    'libopenmpt'
    'portaudio'
)
makedepends=(
    'git'
    'qt6-tools'
    'cmake'
)
optdepends=(
)
source=(
    'git+https://github.com/BLumia/pineapple-tracker-player.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/pineapple-tracker-player

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/pineapple-tracker-player
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/pineapple-tracker-player DESTDIR="$pkgdir" install
    cd ${srcdir}/pineapple-tracker-player
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    #mkdir -p ${pkgdir}/usr/share/licenses/pineapple-pictures-git
    #install ./LICENSE ${pkgdir}/usr/share/licenses/pineapple-pictures-git/LICENSE
}
