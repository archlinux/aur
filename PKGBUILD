# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.9.25
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
	"4550df25517098b59216f9132cdae1d80ca0dcd7afe220193e24068577534f7e5b129eb86d13f5bc43b83ffcb0d319965567e473ce67a5ebb086dc9957d1fe38"
	"3f2da865fb180cdbd170aaaa25bccc2d279e4921a9ad2e34f5894a2aaf02b18a8519331a9f4ec67da6f06b132c1732b41d4b24fb02b56d2c47f69eac65f6ab6e"
)
b2sums=(
	"f95be32d9b51babb886d5a5196ad2f324b3d16e38122d55ac29ca6b2f2b8796594c519a4da047a105d092f618740adc8dcc497d38da014573f151a8f40f68d4d"
	"06af486139bfdcf3ce5fcf400bc6b6e47b001f19711d365c171eb68f7a382401d92c3e7bb2aaafeff6cd83fd823b1c84e613f22a027f391f7249152f2908aacc"
)
b3sums=(
	"44802b170a9b742cb66564dc2fcc7f5e3990e2b1d8b38ca6aade5c22d8e8257a"
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
