# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('waifu2x-converter-cpp')
_srcname='waifu2x-converter-cpp'
pkgdesc='Image Super-Resolution for Anime-Style Art'
pkgver='5.2.1'
_commit='0dc4f71e2ea159a5845fd2214bedfa3f74a93ce8'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/DeadSix27/${_srcname}"
license=('MIT')

depends=('opencv')
makedepends=('git' 'cmake' 'opencl-headers')
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
