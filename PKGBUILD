# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=dtk-terminal-git
pkgver=r71.09d3319
pkgrel=1
pkgdesc='A DTK and QTermWidget based terminal emulator'
arch=('x86_64' 'aarch64')
url='https://github.com/BLumia/deepin-terminal-ng/'
license=('GPL3')
depends=(
    'qtermwidget'
)
makedepends=(
    'git'
    'qt5-tools'
    'cmake'
)
optdepends=(
)
source=(
    'git+https://github.com/BLumia/deepin-terminal-ng.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/deepin-terminal-ng

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/deepin-terminal-ng
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    make -C ${srcdir}/deepin-terminal-ng DESTDIR="$pkgdir" install
    cd ${srcdir}/deepin-terminal-ng
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/dtk-terminal-git
    install ./LICENSE ${pkgdir}/usr/share/licenses/dtk-terminal-git/LICENSE
}
