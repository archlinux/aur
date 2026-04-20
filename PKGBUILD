# Maintainer: mnabila <nblid48 at gmail com>

# Check for new releases:
# $ curl -sSf https://updates.talon-sec.com/linux/prisma-access-browser/deb/dists/stable/main/binary-amd64/Packages | grep -A2 "^Package: prisma-access-browser-stable" | grep Version | sort -V | tail -1

pkgname=prisma-access-browser-bin
_pkgname=prisma-access-browser
pkgver=147.15.6.102
pkgrel=1
pkgdesc="Prisma Access Browser - the secure enterprise browser by Palo Alto Networks"
arch=('x86_64')
url="https://docs.paloaltonetworks.com/prisma-access-browser"
license=('custom')
depends=(
	'alsa-lib'
	'gtk3'
	'libcups'
	'libxss'
	'libxtst'
	'nss'
	'ttf-liberation'
	'xdg-utils'
)
optdepends=(
	'pipewire: WebRTC desktop sharing under Wayland'
	'kdialog: for file dialogs in KDE'
	'gnome-keyring: for storing passwords in GNOME keyring'
	'kwallet: for storing passwords in KWallet'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!emptydirs' '!strip')
_channel=stable
source=("https://updates.talon-sec.com/linux/${_pkgname}/deb/pool/stable/main/${_pkgname}-${_channel}_${pkgver}-1_amd64.deb")
sha256sums=('2daccc236af7093a4635617c8c865695f35f2a60dc77b10e1668f1f148b524fe')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	# Icons
	for i in 16 24 32 48 64 128 256; do
		install -Dm644 "$pkgdir/opt/paloaltonetworks/pab/product_logo_${i}.png" \
			"$pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgname}.png"
	done

	# Remove the Debian cron job and duplicate product logos
	rm -r \
		"$pkgdir/etc/cron.daily/" \
		"$pkgdir/opt/paloaltonetworks/pab/cron/" \
		"$pkgdir/opt/paloaltonetworks/pab/product_logo_"*.png
}
