# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=barva-git
_pkgname=${pkgname%-git}
pkgver=0.1.1
pkgrel=1
pkgdesc="Audio visualizer that pulses the background of your terminal."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('x86_64')
license=('GPL3')
depends=('pulseaudio')
makedepends=('git')
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Kharacternyk/${_pkgname}.git#branch=master")
sha256sums=(SKIP)

pkgver() {
    cd "${srcdir}/${_pkgname}"
    local _version="$(git describe --tags --match 'v*' | sed 's/-/.r/' | sed 's/-/./')"
    printf "${_version#v}"
}

build() {
    cd "${_pkgname}"
    make
}

package() {
    install -Dm755 \
    "${srcdir}/${_pkgname}/barva" \
    "${pkgdir}/usr/bin/barva"

    install -Dm755 \
    "${srcdir}/${_pkgname}/pa-get-default-monitor.sh" \
    "${pkgdir}/usr/bin/pa-get-default-monitor"

    install -Dm644 \
    "${srcdir}/${_pkgname}/README.rst" \
    "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"
}
