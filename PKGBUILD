# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.19.1
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
sha256sums_x86_64=('f31f757349286d609869ad4e78b312b7aa12c2713bce8235c9d78146c418249c')
sha256sums_aarch64=('2ac4b02eec42d608137093cde5b7799255a4020361784a150e67a1cff38c62b3')

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
