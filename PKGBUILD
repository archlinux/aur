# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.9.26
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
	"43c538bdbf0d2c5b65e2de9bbd2404dea98d0c75f64fa5b9f8b2b86d68e08dcc016f9764dc640fe8b2166d458d4f2ba539836d40e02019f416b4bde67c401331"
	"44cc1e987a29faaada1843e32a7afdf494f0946eb86e9cff969b981d94d615762525de89f05d50591685011028f6f0a16050b62a92a68b2ca62224d1e1ef4ec3"
)
b2sums=(
	"22f9d5f05285367d26f530794f74c9d6dbc86e7907219ddf0ff0bcfda72b4ce0ae5f81351ad4a718df1b2eba18f9040f02ea937661e95a9101e3d3c408556d5b"
	"fba03b3086ee9e9c4af02da522ccfcd413cfd3225575a201e54c7ecb98e8bd8d6177c3e32b857f5feef789f93ad33dd65913444a67b0e7180421d350f2e90107"
)
b3sums=(
	"cc660486631d7f12d021fb00a86aafd2b257b501d72518287492c6e86dfe01df"
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
