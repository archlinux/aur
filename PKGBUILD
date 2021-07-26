# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=consoline-git
_pkgname=consoline
pkgver=37
pkgrel=1
pkgdesc="consoline is GNU Readline with better support for asynchronous output"
arch=('i686' 'x86_64')
url="https://github.com/thejoshwolfe/consoline"
license=('GPLv3')
makedepends=('git' 'gcc' 'readline')
source=("${_pkgname}::git+https://github.com/thejoshwolfe/consoline.git" "readline.patch")
md5sums=("SKIP" "a4099f5f442b2c2303f91cf9792288af")

prepare() {
    cd "${srcdir}/${_pkgname}"
    git apply "${srcdir}/readline.patch"
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git rev-list --count HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -Dm755 consoline $pkgdir/usr/bin/consoline
}
