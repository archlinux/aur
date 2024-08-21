# Maintainer: evan <mail@evangoo.de>
_pkgname=drasl
pkgname="${_pkgname}-git"
pkgver=2.0.0.r1.ga249e96
pkgrel=1
pkgdesc="Self-hosted API server for Minecraft"
arch=('x86_64')
url="https://github.com/unmojang/drasl"
license=('GPL-3.0-only')
makedepends=('git' 'go' 'gcc' 'nodejs' 'npm' 'swag')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+https://github.com/unmojang/drasl.git"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make install prefix="${pkgdir}/usr"
	install -D -m644 ./example/config-example.toml "${pkgdir}/etc/drasl/config-example.toml"
	install -D -m644 ./example/config-example.toml "${pkgdir}/etc/drasl/config.toml"
	install -D -m644 ./example/drasl.service "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}
