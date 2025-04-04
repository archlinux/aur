# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributors: Yamashiro <dev cosmicheron com>

_pkgbase='yamagi-quake2-xatrix'
pkgname="${_pkgbase}-git"
pkgver='2.14.r0.gb315ef2'
pkgrel='1'
arch=('i686' 'x86_64' 'aarch64')
pkgdesc="Quake II - Mission Pack 1 ('The Reckoning') for yamagi-quake2 (development version)"
url='https://www.yamagi.org/quake2/'
license=('GPL-2.0-only')
depends=('glibc' 'sh' 'yamagi-quake2')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
install="${_pkgbase}.install"
source=(
    "${_pkgbase}::git+https://github.com/yquake2/xatrix.git"
    "${_pkgbase}.sh"
    "${_pkgbase}.desktop"
)
b2sums=(
    'SKIP'
    'e80203cbda3f903705569b75cf8603dc34a27d43297d987ea7e65334189c978c37ac010e25b9244a2c5f06e20ecaf2df12dbfb644395a522efc9215b468c1b6d'
    'ba6c2af8cfe5f9aff96d92561f6271496317cdf8dee7c5977a9374b996fd5763075c129cd3dccf96849bdeef793b8c9726a24dc4395bac740ef8682bc9f1d035')

pkgver() {
    cd ${_pkgbase}
    git describe --long --tags | sed 's/^XATRIX_//;s/_/./;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    make -C ${_pkgbase}
}

package() {
    cd "${_pkgbase}"

    # game library
    install -Dm644 -t "${pkgdir}/usr/lib/yamagi-quake2/xatrix" 'release/game.so'

    # game launcher
    install -Dm755 "../${_pkgbase}.sh" "${pkgdir}/usr/bin/${_pkgbase}"

    # doc
    install -Dm644 -t "${pkgdir}/usr/share/doc/${_pkgbase}" 'README.md'

    # desktop entry
    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${_pkgbase}.desktop"
}
