# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.9.27
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
	"afe11aa224a6d4cfef132cdb5a35fe4bc2423f1459e62e451f4e5582dccacbb98b39732c03fb0afe0b473fe6daccbe0d48a874cdc72e37069f70eb5440db6d55"
	"44cc1e987a29faaada1843e32a7afdf494f0946eb86e9cff969b981d94d615762525de89f05d50591685011028f6f0a16050b62a92a68b2ca62224d1e1ef4ec3"
)
b2sums=(
	"4f59738710781a61469096572cac62ae964d971ff73e164cc9bb08c4a126a2c290c4e8705e389b0ba4c2805c1680c8f4a51f461cd66326adc0d2004523c4c866"
	"fba03b3086ee9e9c4af02da522ccfcd413cfd3225575a201e54c7ecb98e8bd8d6177c3e32b857f5feef789f93ad33dd65913444a67b0e7180421d350f2e90107"
)
b3sums=(
	"2ba3b697a8ce92ab7c16a638091d7a51507e64cee0332d733164060f80a7618e"
	"2e13b15447a2e27a852a4c96c72976df3ada4738e81661d2c23842511a3f6145"
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
