# Maintainer: Gary Wang <wzc782970009@gmail.com>

pkgname=pineapple-calendar-git
pkgver=r24.0c660e2
pkgrel=1
pkgdesc='Plasmoid applet as a DigitalClock replacement with ability to display Chinese Lunar Calendar'
arch=('x86_64')
url='https://github.com/BLumia/pineapple-calendar/'
license=('GPL')
depends=(
    'qt5-declarative'
    'icu'
    'plasma-workspace'
)
makedepends=(
    'git'
    'qt5-tools'
    'cmake'
    'extra-cmake-modules'
)
optdepends=(
)
source=(
    'git+https://github.com/BLumia/pineapple-calendar.git'
)
md5sums=(
    'SKIP'
)

pkgver() {
    cd ${srcdir}/pineapple-calendar

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
    cd ${srcdir}/pineapple-calendar
    cmake -DBUILD_PLASMOID=ON -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build . -j`nproc`
}

package() {
    DESTDIR="$pkgdir" cmake --build ${srcdir}/pineapple-calendar --target install/strip
    #make -C ${srcdir}/pineapple-pictures DESTDIR="$pkgdir" install
    cd ${srcdir}/pineapple-calendar
    #make INSTALL_ROOT="$pkgdir" install
    #install -Dm755 ./ppic ${pkgdir}/usr/bin/ppic
    mkdir -p ${pkgdir}/usr/share/licenses/pineapple-calendar-git
    touch ./LICENSE # placeholder, the plasmoid and QML c++ extension should be GPL-2.0-or-later
    install ./LICENSE ${pkgdir}/usr/share/licenses/pineapple-calendar-git/LICENSE
}
