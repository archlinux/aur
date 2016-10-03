# Maintainer: Joel Goguen <contact+aur@jgoguen.ca>

pkgname=nodejs-colors
_npmname=colors
_ghname=colors.js
pkgver=1.1.2
pkgrel=1
pkgdesc="Get colors in your node.js console"
arch=('any')
makedepends=('npm')
url="https://github.com/Marak/colors.js"
license=('custom')
source=(
	"https://github.com/marak/${_ghname}/archive/v${pkgver}.tar.gz"
)
sha256sums=(
	'5b7857df523ad6f4f8a5fbf47bfcc68f0084242c71816284e5f67779de181bf9'
)

check() {
	cd "${srcdir}/${_ghname}-${pkgver}"
	npm test
}

package() {
	cd "${srcdir}/${_ghname}-${pkgver}"

	msg 'Installing license...'
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd "${srcdir}"
	local _npmdir="${pkgdir}/usr/lib/node_modules/"

	mkdir -p "${_npmdir}"
	cd "${_npmdir}"

	msg 'Installing...'
	npm install --global --prefix "${pkgdir}/usr" ${_npmname}@${pkgver}
}
