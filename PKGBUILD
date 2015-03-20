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
	 'd39f62be182ac0c5a9e59d120810a972dea2c1bc089e4d0849cc80fdde382259eb3e594f209a1415249ae71bce6e3371ce46f6e9d366b66f832625fcd16478b1'
	 'b7d869972695d796b2a49e35ba6e178a623ee9a3b51d62afea5e2bfd20b84c01d06eac7ce8c09b0a5f94deeb6166e2f0416359dfe4969a8719db761ae389419d')

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
