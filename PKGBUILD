# Maintainer: emersion <contact emersion fr>
pkgname=protonmail-web-git
_pkgname=protonmail-web
pkgver=r6108.8c0ee480c83d
pkgrel=1
license=('MIT')
pkgdesc='Official AngularJS web client for the ProtonMail secure email service'
makedepends=("npm")
arch=("any")
url='https://github.com/ProtonMail/WebClient'
source=("${pkgname%-*}::git+https://github.com/ProtonMail/WebClient.git")
sha1sums=('SKIP')
provides=('protonmail-web')
conflicts=('protonmail-web')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=12 HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	export NODE_ENV=dist
	npm install --cache "${srcdir}/npm-cache"
	npm run build --api=prod
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -dm755 "${pkgdir}/usr/share/webapps/${_pkgname}"
	cp -rL build/* "${pkgdir}/usr/share/webapps/${_pkgname}"
}
