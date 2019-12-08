# Maintainer: Wouter Wijsman <wwijsman@live.nl>

pkgname=alienware-alpha-wmi
pkgver=2.58
pkgrel=1
pkgdesc="A simple script for controlling the lights on the Alienware Alpha/Steam Machine taken from SteamOS"
arch=('any')
url="http://repo.steampowered.com/"
license=('BSD-2')
source=(http://repo.steampowered.com/steamos/pool/main/s/steamos-base-files/steamos-base-files_"$pkgver".tar.xz)
md5sums=('4d46e47f14de407199ba00e88ad3b538')
depends=('sudo')

package() {
	cd "${srcdir}/steamos-base-files-${pkgver}" || exit 2
	install -D -m 644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D usr/bin/alienware_wmi_control.sh "$pkgdir/usr/bin/alienware_wmi_control.sh"

	# Sudo configuration needed for Steam in SteamOS mode
	# Don't use a group, since Steam can be used by any user 
	sed -i "s/steam/ALL/" etc/sudoers.d/alienware_wmi_control
	install -D -m 400 etc/sudoers.d/alienware_wmi_control "$pkgdir/etc/sudoers.d/alienware_wmi_control"
}
