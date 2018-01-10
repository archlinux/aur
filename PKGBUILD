# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('waifu2x-converter-cpp')
_srcname='waifu2x-converter-cpp'
pkgdesc='Image Super-Resolution for Anime-Style Art'
pkgver='5.2'
_commit='f860abfa18a75ed68d3b1e79fe83f6091a6e27e0'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/DeadSix27/${_srcname}"
license=('MIT')

depends=('opencv' 'opencl-headers')
makedepends=('git' 'cmake')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_srcname}"

    cmake \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_BUILD_TYPE='Release' \
        -DINSTALL_MODELS='ON' \
        -DOPENCV_PREFIX='/usr' \
        .
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
}
