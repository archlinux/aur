# Maintainer: Rafflesiaceae <rafflesiaceae.plant@gmail.com>
# shellcheck disable=SC2034,SC2164,SC2154

pkgname=petool-git
_pkgname=petool
pkgver=2024.03.14.r7.g869d58e
pkgrel=2
pkgdesc='Tool to help rebuild, extend and patch 32-bit Windows applications.'
arch=('i686' 'x86_64')
license=('MIT')
url="https://github.com/FunkyFr3sh/petool"
depends=('lib32-glibc')
makedepends=('gcc' 'gcc-libs' 'git' 'make')
provides=('petool')
conflicts=('petool')
options=('!buildflags')

source=("${_pkgname}::git+${url}#branch=${BRANCH:-master}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 petool  "${pkgdir}/usr/bin/petool"
}

# vim:set ft=sh syn=sh ts=4 sw=4 et:
