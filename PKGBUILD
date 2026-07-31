pkgname=systempanel-git
pkgver=r20.36856cc
pkgrel=1
pkgdesc="Adaptive GTK4 system control panel"
arch=('x86_64' 'aarch64')
url="https://github.com/cookiengineer/systempanel"
license=('GPL-3.0-or-later')
depends=('gtk4')
makedepends=('go' 'git')
optdepends=(
	'brightnessctl: Brightness View'
	'bluez-utils: Bluetooth View (bluetoothctl)'
	'feh: Wallpaper View (alternative to hsetroot)'
	'hsetroot: Wallpaper View (alternative to feh)'
	'networkmanager: LAN and Wi-Fi Views'
	'power-profiles-daemon: Power Profile View (powerprofilesctl)'
	'pulseaudio: Volume View (pactl)'
	'smartmontools: S.M.A.R.T. details in Disks View'
	'systemd: Services, Journal, Time & Date View (systemctl, journalctl, timedatectl)'
	'udisks2: Disks View (udiskctl)'
	'upower: Batteries View'
	'util-linux: Disks View (lsblk)'
	'xorg-xrandr: Monitors view'
)
source=("${pkgname%-git}::git+https://github.com/cookiengineer/systempanel.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${pkgname%-git}"
	go build -o systempanel .
}

package() {
	cd "${pkgname%-git}"
	install -Dm755 systempanel "${pkgdir}/usr/bin/systempanel"
	install -Dm644 assets/systempanel.desktop "${pkgdir}/usr/share/applications/systempanel.desktop"
	install -Dm644 GPL-3.0-or-later.txt "${pkgdir}/usr/share/licenses/systempanel/LICENSE"
}
