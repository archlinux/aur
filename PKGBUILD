# Maintainer: ChungZH <chungzh07 at gmail dot com>
pkgname=notepanda
pkgver=0.1.3
pkgrel=2
pkgdesc="A simple cross-platform notepad. Based on Qt and C++."
arch=('x86_64')
url="https://github.com/ChungZH/notepanda"
license=('MIT')
depends=('syntax-highlighting' 'qt5-base>5.14.0' 'qt5-svg')
makedepends=('cmake' 'which' 'make' 'git' 'qt5-tools' 'qt5-declarative' 'gcc' 'ninja')
provides=('notepanda')
conflicts=('notepanda')
source=("notepanda::git+git://github.com/ChungZH/notepanda")
sha512sums=("SKIP")

pkgver() {
    printf "%s" $(cat ${srcdir}/notepanda/makespec/VERSION)
}

prepare() {
    cd "${srcdir}/notepanda"
    git checkout master # stable
}

build() {
	cd "${srcdir}/notepanda"
    mkdir -p build && cd build
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release\
        -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
        -GNinja
	ninja
}

package() {
	cd "${srcdir}/notepanda/build"
    cmake --install .
}
