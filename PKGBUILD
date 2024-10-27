# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-music-git
pkgver=r57.5d609cd
pkgrel=1
pkgdesc='Yet another lightweight music player'
arch=('x86_64')
url='https://code.blumia.cn/blumia/pineapple-music'
license=('MIT')
depends=(
    'qt6-multimedia'
    'taglib'
    'kcodecs'
)
makedepends=(
    'git'
    'qt6-tools'
    'cmake'
)
optdepends=(
    'qt6-multimedia-ffmpeg: Qt6 Multimedia ffmpeg backend'
)
source=(
    'git+https://github.com/BLumia/pineapple-music.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/pineapple-music

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/pineapple-music
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package() {
    make -C ${srcdir}/pineapple-music DESTDIR="$pkgdir" install
    cd ${srcdir}/pineapple-music
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./pineapple-music ${pkgdir}/usr/bin/pineapple-music
    #mkdir -p ${pkgdir}/usr/share/licenses/pineapple-pictures-git
    #install ./LICENSE ${pkgdir}/usr/share/licenses/pineapple-pictures-git/LICENSE
}
