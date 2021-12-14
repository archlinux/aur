# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.9.22
pkgrel=1
pkgdesc="Simple, secure devops tooling built to manage today's complex applications wherever you run your software."
arch=('x86_64')
url="https://github.com/juju/juju"
license=('AGPL3')

makedepends=(
	"go>=1.11"
)
optdepends=(
	"lxd"
)
source=(
	"${url}/archive/${pkgname}-${pkgver}.tar.gz"
	"build.patch"
)
sha512sums=(
	"10183eea93f98d8718051fbe5df11e562c4c31b9b7a7ecf74c33f686d34b5b0e8ad716b01dcf1c1e22bd79fa7c8d4eacacdcf8d5db639d45e1bf636ceea4e622"
	"3f2da865fb180cdbd170aaaa25bccc2d279e4921a9ad2e34f5894a2aaf02b18a8519331a9f4ec67da6f06b132c1732b41d4b24fb02b56d2c47f69eac65f6ab6e"
)
b2sums=(
	"bdb06fff56830f6f2f0c24973db8675f28dfacdf0ffda78de575630b1536077062ab857ee9ddfd746349f37f074e6a5d703c6fa7d42f7af8b33137441a84f628"
	"06af486139bfdcf3ce5fcf400bc6b6e47b001f19711d365c171eb68f7a382401d92c3e7bb2aaafeff6cd83fd823b1c84e613f22a027f391f7249152f2908aacc"
)
b3sums=(
	"3a037325eea96b17fc6a2b899f186009385ecd31853befc57a333e3b0749ce66"
	"062ce9c39abeac590109ef8cbb4a480d322c7b7c1b06f356336be8162b12c4e7"
)

prepare () {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	patch --forward --strip=1 --input="${srcdir}/build.patch"
}
build () {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	export GOPATH="${srcdir}/go"
	make release-install
}
package() {
	cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
	export GOPATH="${srcdir}/go"
	install -D -m755 "${GOPATH}/bin/juju" "${pkgdir}/usr/bin/juju"
	install -D -m755 "${GOPATH}/bin/jujud" "${pkgdir}/usr/bin/jujud"
	install -D -m755 "${GOPATH}/bin/juju-metadata" "${pkgdir}/usr/bin/juju-metadata"
	install -D -m644 LICENCE "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	install -D -m644 etc/bash_completion.d/juju "${pkgdir}/usr/share/bash-completion/completions/juju"
	install -D -m644 etc/bash_completion.d/juju-version "${pkgdir}/usr/share/bash-completion/completions/juju-version"
}
