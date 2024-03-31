# Maintainer: Kimiblock Moe

pkgname=nodejs-reveal.js-git
_pkgname=nodejs-reveal.js
pkgdesc="The HTML Presentation Framework"
url="https://github.com/hakimel/reveal.js"
license=(MIT)
makedepends=('npm' "git")
sha256sums=("SKIP")
arch=(any)
pkgver=5.0.5.r20.g6410c756
pkgrel=1
provides=(nodejs-reveal.js)
conflicts=(nodejs-reveal.js)
source=(
	"git+https://github.com/hakimel/reveal.js.git"
)

function pkgver() {
	cd reveal.js
	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

function build() {
	cd reveal.js
}

function package() {
	cd reveal.js
	#npm install -g --prefix "${pkgdir}/usr"
	install -d "${pkgdir}/usr/lib/node_modules"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	cp "${srcdir}/reveal.js" -r "${pkgdir}/usr/lib/node_modules"
	rm -rf "${pkgdir}/usr/lib/node_modules/reveal.js/.git"
	rm -rf "${pkgdir}/usr/lib/node_modules/reveal.js/.github"
	find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'
	ln -sf "/usr/lib/node_modules/reveal.js/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

