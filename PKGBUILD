# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Previously:
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

# Contributor: Ainola
# Contributor: Ner0
# Contributor: quantax

pkgname='ags-git'
_pkgname='ags'
pkgver=3.4.1.3.r7.gb4199b73
pkgrel=1
pkgdesc="Adventure Game Studio, a development tool that is primarily used to create graphical adventure games"
arch=('i686' 'x86_64')
url='http://www.adventuregamestudio.co.uk/'
license=('custom: Artistic 2.0')
depends=('allegro' 'dumb' 'libogg' 'libtheora' 'libvorbis')
makedepends=('git')
optdepends=('wine: For non-native games')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=('git+https://github.com/adventuregamestudio/ags.git')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"

    git describe --long --tags              \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  \
        | sed 's/v.//'
}

build() {
    cd "${_pkgname}"

    make --directory=Engine
}

package() {
    cd "${_pkgname}"

    install -Dm 755             \
        "Engine/${_pkgname}"    \
        "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm 644     \
        "License.txt"   \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
