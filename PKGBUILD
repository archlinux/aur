# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=1.0.0
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git' 'clang')
provides=('janet')
conflicts=('janet-lang-git')
source=("https://github.com/janet-lang/janet/archive/v${pkgver}.tar.gz")
sha256sums=('0eef1593d2eca1cf48eef86eb02b71a3776fbae88138be8d1408172005af277f')

janet_build='JANET_BUILD=\"c1113d6\"'

# janet_build() {
#     printf 'JANET_BUILD=\"%s\"' "$(git rev-parse --short HEAD)"
# }

#prepare() {
#    cd "${srcdir}/${_pkgname}-${pkgver}"
#}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="/usr" CC=clang $janet_build -j7
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}/usr" $janet_build install
    make PREFIX="${pkgdir}/usr" $janet_build docs
    mkdir -p ${pkgdir}/usr/share/janet
    cp -a examples ${pkgdir}/usr/share/janet
    cp -a build/doc.html ${pkgdir}/usr/share/janet
}
