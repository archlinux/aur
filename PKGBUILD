
_pkgname=minq-update-git-packages
pkgname="${_pkgname}-git"
pkgver=r2.2a4809c3f55f236433b0cedd06da8ffb3aa26639
pkgrel=1
pkgdesc="Updates all -git packages"
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
	ln -s "/opt/${pkgname}/${_pkgname}.py" "${pkgdir}/usr/bin/${_pkgname}"
}
