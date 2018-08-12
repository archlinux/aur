# Maintainer: Ward Segers <w@rdsegers.be>

pkgname='archnord'
pkgver='0.1.0'
pkgrel=2
pkgdesc="Minimal command line script for NordVPN"
arch=('any')
url="https://gitlab.com/editicalu/archnord"
license=('MIT')

# Technically, jq and curl are optional dependencies. But, as the provided functionality is the main reason of existance of this package, I made them normal dependencies. If you wouldn't use the automatic server selection tool, you may use these dependencies instead:
#depends=('nordvpn' 'networkmanager-vpnc' 'openvpn')
#optdepends=('jq: support for getting the country information.' 'curl: finding the best server')
depends=('nordvpn' 'networkmanager-vpnc' 'openvpn' 'jq' 'curl')

provides=("archnord")

source=("https://gitlab.com/editicalu/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('42b46f304f2dda887ccf9e47df45f8e4b7b82160b21eb3d48c87b006e02acbde708ff51262ae6fffc9bdfd354b7caebe8fb4b88b252ded34e1b94249e33204bb')

# Key of the maintainer of this package and the git repo.
validpgpkeys=('CC0B7CE9604A8A91F0D70B778489DB248465FDD7')

prepare() {
	cd "$pkgname-$pkgver"
	cp archnord.sh archnord
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m555 "./archnord" "${pkgdir}/usr/bin/archnord"
	install -D -m644 LICENSE.md "${pkgdir}/usr/share/licenses/archnord/LICENSE"
}
