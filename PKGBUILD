
_pkgname=minq-checkupdates-aur
pkgname="${_pkgname}-git"
pkgver=r2.52858f574f00a99eec1d9d44e1faa1ac3ba03c7d
pkgrel=1
pkgdesc="Simple checkupdates-aur alternative since all other checkupdate-aur(s) are broken"
arch=(any)
url="https://github.com/kuche1/${_pkgname}.git"
license=('GPL')
depends=(paru)
provides=("${_pkgname}")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse HEAD)"
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/opt/${pkgname}"
	cp -rf * "${pkgdir}/opt/${pkgname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	mkdir -p "${pkgdir}/usr/bin/"
	ln -s "/opt/${pkgname}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
