# Maintainer: Gelmo <gelmo[at]outlook.com>
# Maintainer: eugene hwang <hwang dot eug at gmail dot com>

pkgname=xpointerbarrier-fork-git
_pkgname=xpointerbarrier
pkgver=r34.c79cc6d
pkgrel=1
pkgdesc="Restricts your mouse cursor to one monitor. This fork adds the ability to pass through barriers while holding a specific key."
arch=('x86_64')
url="https://github.com/nogard0/xpointerbarrier"
license=('MIT')
depends=('libx11' 'libxfixes' 'libxrandr' 'libxi')
provides=('xpointerbarrier')
conflicts=('xpointerbarrier' 'xpointerbarrier-git')
optdepends=('mouselock: for toggling xpointerbarrier on/off')
options=('!buildflags')
source=("git+https://github.com/nogard0/xpointerbarrier.git")
sha256sums=('SKIP')

pkgver() {
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make
}

package() {
    install -Dm755 "${srcdir}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
