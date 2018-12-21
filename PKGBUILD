# shellcheck disable=SC2034,SC2154,SC2164
pkgname=('tini')
_srcname='tini'
# shellcheck disable=SC2016
pkgdesc='A tiny but valid `init` for containers'
pkgver='0.18.0'
_commit='fec3683b971d9c3ef73f284f176672c44b448662'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/krallin/${_srcname}"
license=('MIT')

depends=('glibc')
makedepends=('git' 'cmake' 'gcc')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${_srcname}::git+${url}.git#commit=${_commit}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${_srcname}"

    cmake -DCMAKE_INSTALL_PREFIX='/usr' .
    make
}

package() {
    cd "${srcdir}/${_srcname}"

    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/bin/tini-static"
}
