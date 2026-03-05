# Maintainer: mnabila <nblid48 at gmail com>

# Check for new releases:
# $ curl -sSf https://updates.talon-sec.com/linux/prisma-access-browser/deb/dists/stable/main/binary-amd64/Packages | grep -A2 "^Package: prisma-access-browser-stable" | grep Version | sort -V | tail -1

pkgname=prisma-access-browser-bin
_pkgname=prisma-access-browser
pkgver=145.30.9.160
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
sha256sums=('e00c3cc59da355766a30fc5d9e1be8c50a82ac88bac2ae90acf9da00682e3085')

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
