# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.9.21
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
	"c2c306a46b734af66947c87e76f7cdc325fb723872ef823cffbea15487885cd80a549943b11cde226f46aff3f3f4a3ddd0f50b36f165f621247f2bdc7feffa7e"
	"3f2da865fb180cdbd170aaaa25bccc2d279e4921a9ad2e34f5894a2aaf02b18a8519331a9f4ec67da6f06b132c1732b41d4b24fb02b56d2c47f69eac65f6ab6e"
)
b2sums=(
	"145e8ec7e58b5a13a9729ce3ec493173236c8e9fdc11a05752eb9948ab066ec07634e6e40a47e8038e64f65d749330c3c375b41ef20ba863a65cd451cd23f78b"
	"06af486139bfdcf3ce5fcf400bc6b6e47b001f19711d365c171eb68f7a382401d92c3e7bb2aaafeff6cd83fd823b1c84e613f22a027f391f7249152f2908aacc"
)
b3sums=(
	"820b6468c323d60abe21f26de6a1462b4b7241642193f416e13aab46ab1d4068"
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
