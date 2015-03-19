# Maintainer: Yardena Cohen <yardenack at gmail dot com>

pkgname=('ascii-fluid-dynamics-git')
pkgver=12.9befe51
pkgrel=7
pkgdesc="Ascii Fluid Dynamics (21st IOCCC honorable mention)"
arch=('any')
url="http://www.ioccc.org/2012/endoh1/hint.html"
license=('Creative Commons')
makedepends=('git')
source=("${pkgname}::git+https://github.com/c00kiemon5ter/ioccc-obfuscated-c-contest.git"
	 'wrapper'
	 'bash-completion')
md5sums=('SKIP'
	 'f78f39c7890e3e7acfbe2dbd0b831970'
	 'f38d4cca534df7aaf78c5c2b832a04e6')

pkgver() {
	cd "${srcdir}/${pkgname}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "${srcdir}/${pkgname}/2012/endoh1"
	make endoh1
	make endoh1_color
}

package() {
	local destdir="${pkgdir}/usr/lib/${pkgname}"
	install -d -m755 "${destdir}"
	install -d -m755 "${pkgdir}/usr/bin"
	install -d -m755 "${pkgdir}/usr/share/bash-completion/completions"
	install -D -m644 "${srcdir}/${pkgname}/2012/endoh1"/*.{txt,c} "${destdir}/"
	install -D -m755 "${srcdir}/${pkgname}/2012/endoh1/endoh1" "${destdir}/"
	install -D -m755 "${srcdir}/${pkgname}/2012/endoh1/endoh1_color" "${destdir}/"
	install -D -m755 "${srcdir}/wrapper" "${pkgdir}/usr/bin/ascii-fluid-dynamics"
	install -D -m644 "${srcdir}/bash-completion" "${pkgdir}/usr/share/bash-completion/completions/ascii-fluid-dynamics"
}
