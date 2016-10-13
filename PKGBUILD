# Maintainer: Jiri Tyr <jiri dot tyr at gmail dot com>

pkgname='plasma-wallpaper-neon-particles-bzr'
_pkgname="${pkgname%-bzr}"
pkgver='0.1.7'
pkgrel=2
pkgdesc='Plasma Wallpaper Neon Particles from Ivan Safonov'
arch=('any')
url='https://code.launchpad.net/~ivan-safonov/+junk/plasma-wallpaper-neon-particles'
license=('GPL')
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'bzr')
provides=("${pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::bzr+https://code.launchpad.net/~ivan-safonov/+junk/${_pkgname}")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"

    printf "%s.%s" $(grep -P -o '(?<=set\(PROJECT_VERSION ")(.[^"]+)' CMakeLists.txt) $(bzr revno)
}

build() {
    cd "$srcdir/${_pkgname}"
    cmake -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "$srcdir/${_pkgname}"
    make DESTDIR="$pkgdir/" install
}
