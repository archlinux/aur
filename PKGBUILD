# Maintainer: @RubenKelevra <cyrond@gmail.com>
# Contributor: Moritz Hedtke alias mohe <Moritz.Hedtke@t-online.de>

pkgname='ipfs-cluster-bin'
pkgver=1.1.6
pkgrel=3
epoch=1
pkgdesc='ipfs-cluster-service, ipfs-cluster-ctl, ipfs-cluster-follow'
arch=('x86_64')
url='https://github.com/ipfs-cluster/ipfs-cluster'
depends=('glibc')
optdepends=(
	'kubo: use a local IPFS node with ipfs-cluster@.service'
	'ipfs-cluster-hardening: optional systemd hardening for ipfs-cluster@.service'
)
license=('MIT OR Apache-2.0')
source=(
	"${url}/releases/download/v${pkgver}/ipfs-cluster-service_v${pkgver}_linux-amd64.tar.gz"
	"${url}/releases/download/v${pkgver}/ipfs-cluster-ctl_v${pkgver}_linux-amd64.tar.gz"
	"${url}/releases/download/v${pkgver}/ipfs-cluster-follow_v${pkgver}_linux-amd64.tar.gz"
	'ipfs-cluster@.service'
	'ipfs-cluster.tmpfiles'
)
sha256sums=(
	'813a5d9f51359b0a55961f57f5e4d92de8031835502c9fa69821ef89d87ef584'
	'fe31c22d7ebeee33bc7e7d63941d4a31e6c96a42e297c890b834d25e1f7a52e2'
	'73d2fb7de6b4162393fac64281915648041add895815c3edd4afa6f8abc4b020'
	'402389b18c44c7aea8a19bb77f6e0b18bc8ec3f3eb860e6cd14ad0b093c92652'
	'e92e5087532737c0e6e10a0f262f2eace5ab8bf6e1d6cbcc37d34b239fabc32c'
)

package() {
	install -Dm755 'ipfs-cluster-service/ipfs-cluster-service' "${pkgdir}/usr/bin/ipfs-cluster-service"
	install -Dm755 'ipfs-cluster-ctl/ipfs-cluster-ctl' "${pkgdir}/usr/bin/ipfs-cluster-ctl"
	install -Dm755 'ipfs-cluster-follow/ipfs-cluster-follow' "${pkgdir}/usr/bin/ipfs-cluster-follow"
	install -Dm644 'ipfs-cluster@.service' "${pkgdir}/usr/lib/systemd/system/ipfs-cluster@.service"
	install -Dm644 'ipfs-cluster.tmpfiles' "${pkgdir}/usr/lib/tmpfiles.d/ipfs-cluster.conf"
	install -Dm644 'ipfs-cluster-ctl/LICENSE-MIT' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
