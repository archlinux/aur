# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('waifu2x-converter-cpp')
_srcname='waifu2x-converter-cpp'
pkgdesc='Image Super-Resolution for Anime-Style Art'
pkgver='5.3.1'
_commit='c85a52548fb2f3a680b73d7af65cea8c48df2d6c'
pkgrel='2'
arch=('i686' 'x86_64')
url="https://github.com/DeadSix27/${_srcname}"
license=('MIT')

depends=('opencv' 'ocl-icd')
makedepends=('git' 'cmake' 'opencl-headers')

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
