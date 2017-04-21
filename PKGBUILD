# Maintainer: Jianfeng Zhang <swordfeng123@gmail.com>

pkgname=cmacro-git
_pkgname=cmacro
pkgver=0.2.42.g3b1400f
pkgrel=1
pkgdesc="Lisp macros for C"
arch=('x86_64')
url="https://github.com/eudoxia0/cmacro"
license=('MIT')
makedepends=('git' 'sbcl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/eudoxia0/cmacro.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --tags --long | sed 's/^v//;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    cd "${srcdir}/${_pkgname}"
    sha256sum cmc
    install -Dm755 "${srcdir}/${_pkgname}/cmc" "${pkgdir}/usr/bin/cmc"
    sha256sum "${pkgdir}/usr/bin/cmc"
    install -Dm644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/licenses/cmacro/LICENSE"
}
