# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
pkgname=fdu-elearning-helper
_pkgname=${pkgname//-/_}
pkgver=0.1.7
pkgrel=2
pkgdesc='A frontend for Fudan eLearning, with many feature added. http://eh.zbyzbyzby.com/'
arch=('any')
url="https://github.com/zhangboyang/${_pkgname}"
license=('MIT')
depends=('xulrunner')
source=("git+${url}.git"
		"${pkgname}.desktop")

pkgver() {
	cd "${srcdir}"
	echo "$(sed -ne 's/^Version=\(.*\)/\1/p' ${_pkgname}/xul/application.ini)"
}

package() {
	install -Dm755 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications/"
	cd "${srcdir}/${_pkgname}"
	for f in `find . -type f -not -path "./.git/*" -not -path "./.gitignore"`; do
		install -Dm644 "$f" "${pkgdir}/usr/share/${pkgname}/$f"
	done
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

md5sums=('SKIP'
         'e64af1767c655ec6f9fc5839a7a64432')
