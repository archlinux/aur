# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.17.2
pkgrel=1
pkgdesc='Identity-aware access proxy'
arch=('x86_64' 'aarch64')
url='https://github.com/pomerium/pomerium'
license=('Apache')
provides=('pomerium')
conflicts=('pomerium')
backup=('etc/pomerium/config.yaml')
optdepends=('pomerium-cli: CLI component for interacting with server')
source=('pomerium.sysusers')
source_x86_64=("pomerium-server-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/pomerium_${pkgver}-1_amd64.deb")
source_aarch64=("pomerium-server-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/pomerium_${pkgver}-1_arm64.deb")
sha256sums=('36b44da89f922a8017d5b26ac6fd71215e4d82525d94161f999aba6e223fd111')
sha256sums_x86_64=('d09df76677cb6c968dfe492ea0d434c9457108c5644fc46eb580b1113a428617')
sha256sums_aarch64=('093d50d6660c17b582e9cba69ddd0c98a6d7337c001d0d2c9e759686714b55a4')

prepare() {
	mkdir -p dump
	bsdtar xf data.tar.gz -C dump
}

package() {
	install -Dm644 pomerium.sysusers "$pkgdir/usr/lib/sysusers.d/pomerium.conf"

	cd dump
	install -D usr/sbin/pomerium -t "$pkgdir/usr/bin/"
	install -Dm644 usr/lib/systemd/system/pomerium.service -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm644 etc/pomerium/config.yaml -t "$pkgdir/etc/pomerium/"
}
