# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=solana-bin
_pkgname="${pkgname%-bin}"
pkgver=1.7.14
pkgrel=1
pkgdesc='Solana CLI tools'
arch=('x86_64')
url='https://solana.com'
license=('Apache')
depends=(
	'openssl'
	'systemd-libs'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(
	"$_pkgname-$pkgver.tar.bz2::https://github.com/$_pkgname-labs/$_pkgname/releases/download/v$pkgver/$_pkgname-release-x86_64-unknown-linux-gnu.tar.bz2"
	"$_pkgname.sysusers"
	"$_pkgname.tmpfiles"
	#"$_pkgname-sys-tuner.service"
	#"$_pkgname-test.service"
)
sha256sums=('e3d00cee36ccb3d1de2bec1326e6740e48b94b0d7607abcf9dfc7a7c70554d58'
            '3e893948c70e514ee369253fe37cf1d7cb3f99d350656f3c9a777ea87f895ca6'
            '4a5a6060c734f0c85d4e13e5124ee30f6612a6a812642d043e0bff18790776f5')

package() {
	install -Dm 755 "$_pkgname-release/bin/"{cargo-*,solana*,spl-token} -t "$pkgdir/usr/bin"
	install -Dm 644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm 644 "$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	#install -Dm 644 "$_pkgname"-*.service -t "$pkgdir/usr/lib/systemd/system"
}

# vim: ts=2 sw=2 et:
