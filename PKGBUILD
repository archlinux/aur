# Maintainer: Sam Whited <xmpp:sam@samwhited.com?message>

pkgname=terraform-provider-acme
pkgver=1.0.1
pkgrel=1
pkgdesc='Terraform provider for ACME certificate provisioning (Lets Encrypt)'
url='https://www.terraform.io/docs/providers/acme/index.html'
arch=('x86_64')
license=('MPL2')
depends=('glibc')
makedepends=('go')
optdepends=('terraform: uses this plugin')
source=("https://github.com/terraform-providers/${pkgname}/archive/v${pkgver}.tar.gz"
        'go.mod')
sha256sums=('d75e9b21503865226f36d6a56934459a10079f44856120e5fc0b59b44671488c'
            'c2a68f5728d43e048011eddd5590c4bcac8a1237a9076250e3fd55fe5efe432f')

prepare() {
	# This is a hack to let us build outside of GOPATH.
	cp go.mod "${pkgname}-${pkgver}"
}

build() {
	cd "${pkgname}-${pkgver}"
	GO111MODULE=on go build
}

package() {
	cd "${pkgname}-${pkgver}"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}_v${pkgver}"
}

# vim:set ts=2 sw=2 noexpandtab:
