# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=1.1.0
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
sha256sums=('e58f8294d985140ea88ce7dfc0c79b5e83a0134fa5838ba3cb62afd36a362d1a')

janet_build='JANET_BUILD=\"3928136\"'

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
