# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=boston-icon-theme-git
pkgver=r255.21d4729
pkgrel=1
pkgdesc="Boston is a highly minimalist icon theme, with a sober color palette inspired on basic hues."
arch=('any')
url="https://github.com/heychrisd/Boston-Icons"
license=('GPL3')
conflicts=('boston-icon-theme')
provides=('boston-icon-theme')
source=("${pkgname}::git+${url}")
options=(!emptydirs)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname}"

    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 license "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 third-party "${pkgdir}/usr/share/licenses/${pkgname}/third-party"

    install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 patrons.md "${pkgdir}/usr/share/doc/${pkgname}/patrons.md"
    install -D -m644 changelog "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG"

    install -d -m755 "${pkgdir}/usr/share/icons/Boston"
    for size in 16 48 128 legacy symbolic; do
        mv "${size}" "${pkgdir}/usr/share/icons/Boston/${size}"
    done
    install -D -m644 index.theme "${pkgdir}/usr/share/icons/Boston/index.theme"

	#cp -a "${srcdir}/${pkgname}" "${pkgdir}/usr/share/icons/Boston"
}
