# Maintainer: vorpalblade77@gmail.com

pkgname=steamcurses-git
_pkgname=${pkgname%-git}
_srcname=SteamCurses
pkgver=8c106e6
pkgrel=2
pkgdesc="Steam Ncurses for both native and wine versions"
arch=('i686' 'x86_64')
url="https://github.com/TOTBWF/SteamCurses"
license=('MIT')
depends=('ncurses')
optdepends=('steam:	Native Steam support'
    'wine: Wine Steam support')
provides=('steamcurses')
conflicts=('steamcurses')
changelog=changelog.txt
source=('git+https://github.com/TOTBWF/SteamCurses.git')
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    git describe --always | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
build() {
    cd "${srcdir}/${_srcname}"
    make ${MAKEFLAGS}
}

package() {
    # No make install available now
    mkdir --parent "${pkgdir}/usr/bin"
    cp "${srcdir}/${_srcname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    mkdir --parent "${pkgdir}/usr/share/licenses/${pkgname}"
    cp "${srcdir}/${_srcname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
