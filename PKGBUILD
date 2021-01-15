# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.8.7
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
	"ab132ff2ddcf1612b17ea584f46352a92e2fb676b5ebf056a501fa297fee88f837ee1018ebb5c4b0ac34baca6f996f9ed81c995065ef4cfdac4c79db147b43bc"
	"3f2da865fb180cdbd170aaaa25bccc2d279e4921a9ad2e34f5894a2aaf02b18a8519331a9f4ec67da6f06b132c1732b41d4b24fb02b56d2c47f69eac65f6ab6e"
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
