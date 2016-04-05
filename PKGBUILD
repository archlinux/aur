# Maintainer: Vasya Novikov <vnnn91@yandex.ru> (replace "nnn" with a single "n")

pkgname=bambam
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple baby keyboard masher application."
arch=('any')
url="https://github.com/porridge/${pkgname}"
license=('GPLv3')
depends=('python2' 'python2-pygame')
source=(https://github.com/porridge/${pkgname}/archive/master.zip
	${pkgname}.desktop)
sha256sums=('SKIP'
	'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}-master"

	# allow bambam to be executed from a symlink
	# remove these lines if/after a corresponding PR gets merged to master
	sed -i -e 's/normpath/realpath/' bambam.py
}

package() {
	cd "${srcdir}/${pkgname}-master"

	mkdir -p ${pkgdir}/usr/share/icons
	cp icon.gif ${pkgdir}/usr/share/icons/${pkgname}.gif

	mkdir -p ${pkgdir}/usr/share/games/${pkgname}
	cp -R bambam.py data ${pkgdir}/usr/share/games/${pkgname}/

	mkdir -p ${pkgdir}/usr/share/applications
	cp ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/

	mkdir -p ${pkgdir}/usr/bin
	ln --symbolic ../share/games/${pkgname}/bambam.py ${pkgdir}/usr/bin/${pkgname}
}
