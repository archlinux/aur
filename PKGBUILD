# Maintainer: Nazar Vinnichuk <nazar.vinnichuk at tutanota dot com>
pkgname=barva-git
_pkgname=${pkgname%-git}
pkgver=0.2.r4.g0071663
pkgrel=1
pkgdesc="An audio visualizer that pulses the background of your terminal."
url="http://github.com/Kharacternyk/${_pkgname}"
arch=('any')
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
    cd "${srcdir}/${_pkgname}"
    install -Dm755 barva "${pkgdir}/usr/bin/barva"
    install -Dm644 README.rst "${pkgdir}/usr/share/doc/${_pkgname}/README.rst"

    cd scripts
    for _SCRIPT in *; do
        install -Dm755 "$_SCRIPT" "${pkgdir}/usr/share/${_pkgname}/${_SCRIPT}"
    done

}
