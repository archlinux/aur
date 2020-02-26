# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('waifu2x-converter-cpp')
_srcname='waifu2x-converter-cpp'
pkgdesc='Image Super-Resolution for Anime-Style Art'
pkgver='5.3.3'
_commit='b45498b9f249dc57179b066c55322fd9ca575bef'
pkgrel='1'
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
