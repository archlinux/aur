pkgname=('tini')
srcname='tini'
pkgdesc='A tiny but valid `init` for containers'
pkgver='0.10.0'
pkgrel='1'
arch=('i686' 'x86_64')
url="https://github.com/krallin/${srcname}"
license=('MIT')

depends=('glibc')
makedepends=('git' 'cmake' 'gcc' 'vim')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

source=("${srcname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

build() {
    cd "${srcdir}/${srcname}"

    cmake -DCMAKE_INSTALL_PREFIX='/usr' .
    make
}

package() {
    cd "${srcdir}/${srcname}"

    make DESTDIR="${pkgdir}" install
    rm "${pkgdir}/usr/bin/tini-static"
}
