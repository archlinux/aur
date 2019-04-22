# Maintainer: Quentin Bazin <quent42340 at gmail dot com>

_pkgname=unarelith
pkgname="${_pkgname}-git"
pkgver=r27.d547af0
pkgrel=1
pkgdesc="Unarelith's website"
arch=("i686" "x86_64")
url="https://git.unarelith.net/Unarelith/unarelith.net"
depends=("python" "python-virtualenv")
provides=("unarelith")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	# Copy files to package
	mkdir -p "${pkgdir}/usr/share/webapps/unarelith/"
	cp -r "${_pkgname}"/* "${pkgdir}/usr/share/webapps/unarelith/"
	cd "${pkgdir}/usr/share/webapps/unarelith/"

	# Set permissions
	chown http:http .
	chown http:http -R static

	bash setup_prod.sh
}

