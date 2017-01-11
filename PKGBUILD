# Maintainer: Willem Mulder <14mRh4X0r@gmail.com>
_pkgname=passff
pkgname=firefox-passff
pkgver=0.1.32
pkgrel=1
pkgdesc="zx2c4 pass manager addon for firefox"
arch=(any)
url="https://github.com/nwallace/passff"
license=('GPL2')
groups=(firefox-addons)
depends=(firefox)
makedepends=(make zip sed)
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/nwallace/passff/archive/${pkgver}.tar.gz")
sha256sums=('77be6d1ee8494013fd66129de479007841f0213daa38b2879178373e193433c1')

build() {
	cd "$srcdir/${_pkgname}-${pkgver}/src"
	make
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}/src"

	local ext_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
	install -Dm644 ../bin/${_pkgname}.xpi \
		"${pkgdir}/usr/lib/firefox/browser/extensions/${ext_id}.xpi"
}
