# Maintainer: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Ainola
# Contributor: Ner0
# Contributor: quantax

# Previously:
# Maintainer: Frederic Bezies <fredbezies at gmail dot com>

pkgname='ags-git'
_pkgname='ags'
pkgver=3.4.1.1.r13.g6053e954
pkgrel=1
pkgdesc="Adventure Game Studio, a development tool that is primarily used to create graphical adventure games"
arch=(
    'i686'
    'x86_64'
)
url='http://www.adventuregamestudio.co.uk/'
license=(
    'custom: Artistic 2.0'
)
depends=(
    'allegro'
    'dumb'
    'libogg'
    'libtheora'
    'libvorbis'
)
makedepends=(
    'git'
)
optdepends=(
    'wine: For non-native games'
)
conflicts=(
    'ags'
)
source=(
    'git+https://github.com/adventuregamestudio/ags.git'
)
sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit 1

    git describe --long --tags              \
        | sed 's/\([^-]*-g\)/r\1/;s/-/./g'  \
        | sed 's/v.//'
}

build() {
    cd "${srcdir}/${_pkgname}" || exit 1

    make --directory=Engine
}

package() {
    install -Dm755                                    \
        "${srcdir}/${_pkgname}/Engine/${_pkgname}"    \
        "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644                            \
        "${srcdir}/${_pkgname}/License.txt"   \
        "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}


