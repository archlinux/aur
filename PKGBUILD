#Maintainer twa022 <twa022 at gmail dot com>

pkgname=ladon
pkgver=1.0.6
pkgrel=1
pkgdesc="Utility to process many files in parallel"
url="https://github.com/danielgtaylor/ladon"
arch=('any')
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('86b49c434931b99547f6415e5369f541cdb0c99beb8a46af3efbe472ff37d89e')

build() {
    cd "${pkgname}-${pkgver}"
    npm install --production
}

package() {
    cd "${pkgname}-${pkgver}"

	mkdir -p "${pkgdir}"/usr/{bin,lib/ladon}
	cp -ar --no-preserve=ownership ladon.js node_modules package.json "${pkgdir}/usr/lib/ladon"

	cat > "${pkgdir}"/usr/bin/ladon <<- __EOF__
	#!/bin/bash
	/usr/lib/ladon/ladon.js "\$@"
	__EOF__
	chmod 755 "${pkgdir}"/usr/bin/ladon
}
