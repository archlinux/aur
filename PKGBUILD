# Maintainer: Tony Lambiris <tony@libpcap.net>
pkgname=breeze-adapta-cursor-theme-git
_pkgname=Breeze-Adapta-Cursor
pkgver=r34.72ffeff
pkgrel=3
pkgdesc="Popular Breeze Cursor modified for Adapta theme."
arch=('any')
url="https://github.com/mustafaozhan/Breeze-Adapta-Cursor"
license=('GPL')
source=("git+https://github.com/mustafaozhan/Breeze-Adapta-Cursor")
makedepends=('git' 'unzip')
conflicts=('breeze-adapta-cursor-theme' 'xcursor-breeze-adapta')
provides=('breeze-adapta-cursor-theme' 'xcursor-breeze-adapta')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"

    install -dm755 "${pkgdir}/usr/share/icons"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

    cp -a "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/icons/Breeze-Adapta-Cursor"

    # fix icon cache rebuilding
    rename ' ' '-' "${pkgdir}/usr/share/icons/Breeze-Adapta-Cursor/cursors"/*
}
