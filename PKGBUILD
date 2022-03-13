# Maintainer: Hugh Gao <hughgao01 at gmail dot com>

pkgname=dappy
pkgver=0.5.4
pkgrel=1
pkgdesc="Secure browser and name system based on blockchain"
arch=('x86_64')
url="https://dappy.tech/"
license=('custom:dappy')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'util-linux' 'libappindicator-gtk3' 'libsecret')
options=('!emptydirs' '!strip')
install=$pkgname.install
_channel=stable
source=("https://github.com/fabcotech/dappy/releases/download/0.5.4/dappy-0.5.4-linux-amd64.deb"
        "https://raw.githubusercontent.com/fabcotech/dappy/master/LICENSE")
sha256sums=('d7f792017e1629fefd1bde083ab3b35c2064d57adb26765a780950752e107f7b' 'SKIP')

package() {
	echo "  -> Extracting the data.tar.xz..."
	bsdtar -xf data.tar.xz -C "$pkgdir/"

	echo "  -> Moving stuff in place..."
	# Launcher
  mkdir -p "$pkgdir"/usr/bin/
  ln -sf "$pkgdir"/opt/dappy/dappy  "$pkgdir"/usr/bin/dappy

  chmod 4755 "$pkgdir"/opt/dappy/chrome-sandbox

	# License
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/dappy/LICENCE
}
