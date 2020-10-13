# Maintainer: Mihai-Drosi Câju at cajum dot bugs at yandex dot com
pkgname=juju
pkgver=2.8.5
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
	"24d37b2670fd508c21c21b109d46daa23fd7962c8c3a7cb1f8dbc50cf0caa92fa082de9d19683f26e8893643fbb9ff7cbc2683d13d876c7549c52b5446460cdd"
	"8cdd75296e3d2b3f9dd58b83dbac0f642e9f073eb1ef0cf89823ae287a680aa3311248a860dccf5acfe78bfed67fe9d14cdf5d52799ea5b6c6e3ee34073b4c26"
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
	install -D -m644 "${srcdir}/${pkgname}-${pkgname}-${pkgver}/etc/bash_completion.d/juju" "${pkgdir}/usr/share/bash-completion/completions/juju"
	install -D -m644 "${srcdir}/${pkgname}-${pkgname}-${pkgver}/etc/bash_completion.d/juju-version" "${pkgdir}/usr/share/bash-completion/completions/juju-version"
}
