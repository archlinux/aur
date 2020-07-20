# Maintainer: Gabriel-Andrew Pollo-Guilbert <gabrielpolloguilbert@gmail.com>

pkgname=librseq-git
pkgver=r70.d1cdec9
pkgrel=1
pkgdesc='Library for Restartable Sequences'
arch=('i686' 'x86_64')
url='https://github.com/compudj/librseq'
license=('custom')
source=("git+https://github.com/compudj/librseq.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/librseq"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/librseq"

    ./bootstrap
    ./configure --prefix="${pkgdir}/usr"
}

build() {
    cd "${srcdir}/librseq"

    make
}

check() {
    cd "${srcdir}/librseq"

    make check
}

package() {
    cd "${srcdir}/librseq"

    make install

    sed -i "s#${pkgdir}##g" "${pkgdir}/usr/lib/pkgconfig/librseq.pc"
}
