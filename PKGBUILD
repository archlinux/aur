# Maintainer: Brad Erhart <tocusso underscore malty at aleeas dot com>
# Maintainer: Vincent Bernardoff <vb@luminar.eu.org>

pkgname=solana-bin
_pkgname="${pkgname%-bin}"
pkgver=1.6.27
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
b2sums=(
	d837c850e4e3e3d13663e13452992949e9ece29ffb7cd383bd9237202723ea9f0737bba2f62a61771abece9ed82376e3da664c387b1169372fa92c1874840ab8
	8be1bc3e98d08e9c588e083cff3f1613f4516196d0f8aaa0b06b1fed07b3f4a7ca28031315275acaccedbd99ff657ac565d9be47384d342252767e7ff0d93677
	d54f607c859e70bd377bf386b4bcf90509854a01904816deb9a64a1fff466468bd03b4513fd622eaad9f2c4a03c0ed83bc7537a79911d9a1ebe7b9371f690655
	#b579d50843cb5a1e58c5369dc192e9443ed8970e11c3e903cf0f419cf7ba3a1ce0ae94cad76867a2afb0a6f2e99b8213dc8f042cd593252e0b92c926da7121cf
	#3574dd1fefedaf508d31853fa8f5e53b2cd66025bfdcd8f569f30597f0fd2eaace47c48d47d188191381f042e7a84b0200d2b1828e8db6fc1883f52f06c435b1
)

package() {
	install -Dm 755 "$_pkgname-release/bin/"{cargo-*,solana*,spl-token} -t "$pkgdir/usr/bin"
	install -Dm 644 "$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
	install -Dm 644 "$_pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf"
	#install -Dm 644 "$_pkgname"-*.service -t "$pkgdir/usr/lib/systemd/system"
}

# vim: ts=2 sw=2 et:
