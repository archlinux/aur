# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Rolinh <robinDOThahlingATgw-computingDOTnet>

pkgname=tagutil
pkgver=3.1
pkgrel=1
pkgdesc="scriptable music files tags tool and editor"
arch=('i686' 'x86_64')
url="https://github.com/kAworu/tagutil"
license=('BSD')
depends=(
    'libyaml'
    'taglib'
    'flac'
    'libvorbis'
    'jansson'
)
makedepends=(
    'cmake'
)
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('a5a88f8f40c3654e902066e4aba8e6c4e2c89fcf64ca823d81db80c3dad41a80')

build() {
    cd "${pkgname}-${pkgver}"

    #sed -i 's/_BSD_SOURCE/_DEFAULT_SOURCE/g' src/CMakeLists.txt

    mkdir build
    cd build
    cmake ../src -DPREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
    make
}

package() {
    cd "${pkgname}-${pkgver}/build"

    make DESTDIR="${pkgdir}" install
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE"
}

# vim:set ts=4 sw=4 et:
