# Contributor: BluePeril <blueperil (at) blueperil _dot_ de>

_pkgname=lottieconverter
pkgname=lottieconverter-git
pkgver=r10.e515646
pkgrel=1
pkgdesc='Simple, dummy lottie converter '
arch=('i686' 'x86_64')
url='https://github.com/sot-tech/LottieConverter'
license=('LGPL-v2.1')
makedepends=("git")
depends=('rlottie-git')
provides=(${_pkgname})
replaces=(${_pkgname})
source=(${_pkgname}::"git+https://github.com/sot-tech/LottieConverter.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"

    make CONF=Release || return 1
}

package() {
    cd "${_pkgname}"

    install -d -m755 "${pkgdir}/usr/bin"
    install -D -m755 dist/Release/GNU-Linux/lottieconverter "${pkgdir}/usr/bin/lottieconverter"
}

# vim:set ts=8 sts=2 sw=2 et:
