# Maintainer: Kimiblock Moe
# Contributor: evan <mail@evangoo.de>
_pkgname=drasl
pkgname="${_pkgname}"
pkgver=2.1.1
pkgrel=1
pkgdesc="Yggdrasil-compatible API server for Minecraft"
arch=('x86_64' 'aarch64')
url="https://github.com/unmojang/drasl"
license=('GPL-3.0-only')
makedepends=('git' 'go' 'gcc' 'nodejs' 'npm' 'swag')
conflicts=("${_pkgname}")
source=(
	"${_pkgname}::git+https://github.com/unmojang/drasl.git#tag=v${pkgver}"
)
sha256sums=('6ba66b5d2a964bc2ff370373fc511f1e8d8a1e43beb5d9bed56c1746e5bd19c2')

#function pkgver() {
#	cd "${srcdir}/${_pkgname}"
#	git describe --long --tags --abbrev=8 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
#}

function build() {
	cd "${srcdir}/${_pkgname}"
	make
}

function package() {
	cd "$srcdir/${_pkgname}"
	make install prefix="${pkgdir}/usr"
	install -D -m644 ./example/config-example.toml "${pkgdir}/etc/drasl/config-example.toml"
	install -D -m644 ./example/config-example.toml "${pkgdir}/etc/drasl/config.toml"
	install -D -m644 ./example/drasl.service "${pkgdir}/etc/systemd/system/${_pkgname}.service"
}

