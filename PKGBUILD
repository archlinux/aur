# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Yamashiro <dev cosmicheron com>

_pkgbase='yamagi-quake2-ctf'
pkgname="${_pkgbase}-git"
pkgver='1.11.r0.g3a1863f'
pkgrel='1'
arch=('i686' 'x86_64')
pkgdesc='Quake II - Three Wave Capture The Flag for yamagi-quake2 (development version)'
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('glibc' 'sh' 'yamagi-quake2')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=(
    "${_pkgbase}::git+https://github.com/yquake2/ctf.git"
    "${_pkgbase}.sh"
    "${_pkgbase}.desktop"
)
b2sums=(
    'SKIP'
    'a795e4c5fe15f5de92ad454cb165ead6a385a31451bf856a7191740ee9164f54d32fbd8eedf48c2585e47ed60c79c2caf84a5cb21d50ef3e8c6f0834c5e5e6ac'
    'e982a00b16c4982aea0fd566632b5c4e2d0680059025b56a92d844795700b65d77a79c9506dee07a8ab537bee960b3307c29f72b464d72d8a34a9244a04e2d47'
)

pkgver() {
    cd "$_pkgbase"
    git describe --long --tags | sed 's/^CTF_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C "$_pkgbase"
}

package() {
    cd "$_pkgbase"

    # game library
    install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/ctf" 'release/game.so'

    # game launcher
    install -Dm755 "../${_pkgbase}.sh" "${pkgdir}/usr/bin/${_pkgbase}"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" 'README.md'

    # desktop entry
    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${_pkgbase}.desktop"
}
