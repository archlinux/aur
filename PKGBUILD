# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.9.19
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
	"30af1302f2f6ec0f899b27322e1b4cac6dc364be7b77ba945d468e8dd5ac5610f1714527f3523007e15975ef93b0b96a162b7c348974623da2def3f6dda5af26"
	"3f2da865fb180cdbd170aaaa25bccc2d279e4921a9ad2e34f5894a2aaf02b18a8519331a9f4ec67da6f06b132c1732b41d4b24fb02b56d2c47f69eac65f6ab6e"
)
b2sums=(
	"8daade064c0bdf51539cdfd04336c99013c123073f21e3c51e3c5455e3fcf6d69e3aa7139f9a5965dbd534dfae19f21fb513291486c146aa6927d123c85111aa"
	"06af486139bfdcf3ce5fcf400bc6b6e47b001f19711d365c171eb68f7a382401d92c3e7bb2aaafeff6cd83fd823b1c84e613f22a027f391f7249152f2908aacc"
)
b3sums=(
	"e0256e5bd0764b63465cc8cf3ff09b7065b0325e62ffb31d4cd50b1b551fda38"
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
