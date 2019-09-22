# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=1.3.1
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
sha256sums=('f14de9e2e1db5707e48a15f4262f4ce8c9ff99b2b3abc59ea6a1493d54bd4ed4')

janet_build='JANET_BUILD=\"7809f89\"'

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
