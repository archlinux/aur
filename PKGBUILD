# Maintainer: FadeMind <fademind@gmail.com>

pkgname=maia-cursor-theme-git
pkgver=20180322.f72e913
pkgrel=1
pkgdesc='Maia cursor theme for Plasma (git version)'
arch=('any')
url='https://github.com/FadeMind/maia-cursor-theme'
license=('GPL')
makedepends=('cmake' 'git' 'inkscape' 'libcanberra' 'xorg-xcursorgen')
conflicts=("${pkgname/-git/}")
replaces=("${pkgname/-git/}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd ${pkgname/-git/}
    (
    git show --format='%cI' -q master | sed 's/T.*//g;s/-//g'
    echo .
    git rev-parse --short master
    ) | tr -d '\n'
}

build() {
    . ${srcdir}/${pkgname/-git/}/build.sh
    mkdir -p ${srcdir}/build
    cd ${srcdir}/build
    cmake ../${pkgname/-git/}
    make
}

package() {
    make -C build DESTDIR="${pkgdir}" install
}
