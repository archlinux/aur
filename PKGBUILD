# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.15.0
pkgrel=1
pkgdesc='An identity-aware access proxy'
arch=('x86_64' 'aarch64')
url="https://www.pomerium.io"
license=('Apache')
optdepends=('pomerium-cli: CLI component for interacting with server')
provides=('pomerium')
conflicts=('pomerium')
backup=('etc/pomerium/config.yaml')
source=('pomerium.sysusers')
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium_${pkgver}-1_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium_${pkgver}-1_arm64.deb")
sha256sums=('36b44da89f922a8017d5b26ac6fd71215e4d82525d94161f999aba6e223fd111')
sha256sums_x86_64=('121e4e16b32820a5d5433f2f60cd59753b5ea2a91eaf6bc995400b3a2dc30482')
sha256sums_aarch64=('6303401b1ac8efc6579bee3fbdee03220fa706c42b3cc0388f1b0c37324428e2')

prepare() {
	mkdir dump
	bsdtar xf data.tar.gz -C dump
}

package() {
	install -Dm 644 pomerium.sysusers "$pkgdir/usr/lib/sysusers.d/pomerium.conf"

	cd dump
	install -Dm 755 usr/sbin/pomerium -t "$pkgdir/usr/bin/"
	install -Dm 644 usr/lib/systemd/system/pomerium.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 etc/pomerium/config.yaml -t "$pkgdir/etc/pomerium/"
}
