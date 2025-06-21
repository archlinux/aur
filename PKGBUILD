# Maintainer: push_sla <push2001sla at gmail dot com>

# Source code maintainer credentials, who did the amazing work,
#     appear at ${url}/README.md

pkgname="terraform-provider-selectel"
pkgdesc="Terraform Selectel Provider"
url="https://github.com/selectel/terraform-provider-selectel"
license=('MPL-2.0')

pkgver="6.5.0"
pkgrel="2"

arch=('x86_64')
depends=('glibc')
makedepends=('go>=1.23.0' 'make>=4.0.0' 'git')
optdepends=(
	'terraform: tool for building infrastructure'
	'terraform-provider-openstack: additional capabilities'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9ecd2e1df29387e77c0f4d75a5db73b397b0b4958f5caef3ef47e954fa5f621d')

build(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CXXFLAGS="${CXXFLASG}"
	export GOFLAGS="-buildmode=pie -trimpath -modcacherw"
	make build
}

check(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make test
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm555 $pkgname "${pkgdir}/usr/share/terraform/plugins/registry.terraform.io/selectel/selectel/${pkgver}/linux_amd64"
}
