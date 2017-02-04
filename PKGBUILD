# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('waifu2x-converter-cpp')
_srcname='waifu2x-converter-cpp'
pkgdesc='Image Super-Resolution for Anime-Style Art'
pkgver='4.0'
_commit='f2cbb2e7d8d2be2f1083d7832914d68d8724bd9e'
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
        -DOVERRIDE_OPENCV='ON' \
        .
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
}
