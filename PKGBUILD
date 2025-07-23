# Maintainer: intothegnu <intothegnu@protonmail.com>

pkgname="personalanimelist"
pkgver="1.0.1"
pkgrel="1"
pkgdesc="Minimal TUI anime list that stays on your computer. Supports Kitsu integration."
arch=('x86_64')
depends=('glibc' 'sqlite')
makedepends=('git' 'go>=1.22')
license=('GPL')
url="https://codeberg.org/IntoTheGNU/PersonalAnimeList"
source=("https://codeberg.org/IntoTheGNU/PersonalAnimeList/archive/${pkgver/rc/-rc}.tar.gz")
md5sums=('cbf4b8e1c2de9ad600c3190b9253d1c4')

build (){
	cd "${pkgname}" || exit 1
	make
	gzip -f "${srcdir}/${pkgname}/man/paltui.5"
}

package(){
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/man/man5"
	cp -p "${srcdir}/${pkgname}/paltui" "${pkgdir}/usr/bin/paltui"
	cp -p "${srcdir}/${pkgname}/palcli" "${pkgdir}/usr/bin/palcli"
	cp -p "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
	cp -p "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	cp -p "${srcdir}/${pkgname}/man/paltui.5.gz" "${pkgdir}/usr/share/man/man5/paltui.5.gz"
}
