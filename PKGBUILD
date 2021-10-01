# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.9.15
pkgrel=1
pkgdesc="Simple, secure devops tooling built to manage today's complex applications wherever you run your software."
arch=('x86_64')
url="https://github.com/juju/juju"
license=('AGPL3')

makedepends=(
	"go>=1.11"
)
depends=(
	"lxd"
)
source=(
	"${url}/archive/${pkgname}-${pkgver}.tar.gz"
	"build.patch"
)
sha512sums=(
	"bf074fc804801e1b89a52f0b824f413fa672a88cb4a0b7e7eb2d8e854ddee1fad66444e4f4464a527e4421bd705039ff863cc9589363037ac77c101010033fdf"
	"3f2da865fb180cdbd170aaaa25bccc2d279e4921a9ad2e34f5894a2aaf02b18a8519331a9f4ec67da6f06b132c1732b41d4b24fb02b56d2c47f69eac65f6ab6e"
)
b2sums=(
	"cf724eb9eab4329e133ea277602961c86ec57d87d39dcfdded887875625e50002afd0247ea5ed36c3761bdece275ef61c66d073bc772541a92d55f3075e7319f"
	"06af486139bfdcf3ce5fcf400bc6b6e47b001f19711d365c171eb68f7a382401d92c3e7bb2aaafeff6cd83fd823b1c84e613f22a027f391f7249152f2908aacc"
)
b3sums=(
	"815b414816619f8c3b4f063ce168356911c5e291978d1acdb2797851d342a7aa"
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
