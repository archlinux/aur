# Maintainer: Iván Zaera Avellón <ivan.zaera@posteo.net>
pkgname=my-sway
pkgver=0.0.30
pkgrel=1
pkgdesc='A lightweight desktop environment based on Sway'
arch=('pentium4' 'x86_64')
url='https://codeberg.com/ivan-zaera/my-sway'
license=('GPL-3.0-or-later')
depends=(
	'baobab'
	'bash'
	'blueman'
	'cliphist'
	'coreutils'					# printf, sort, uniq
	'findutils'					# find
	'fuzzel'
	'gawk'
	'gnome-disk-utility'		# gnome-disks
	'gnome-firmware'
	'gnome-system-monitor'
	'libpulse'					# pactl
	'mako'
	'networkmanager-dmenu'
	'noto-fonts'
	'noto-fonts-emoji'
	'nwg-look'
	'polkit-gnome'
	'procps-ng'					# pkill
	'qt6ct'
	'rofimoji'
	'systemd'					# systemd-cat, systemctl
	'sway'
	'sway-contrib'				# grimshot
	'swaybg'
	'swayidle'
	'swaylock'
	'waybar'
)
optdepends=(
	'foot: Default terminal'
	'librewolf: Default browser'
	'thunar: Default file manager'
)
makedepends=(
	'coreutils'
)
backup=(
)
install='install.sh'

source=(
	"$pkgname-$pkgver.tar.gz::https://codeberg.org/ivan-zaera/$pkgname/archive/$pkgver.tar.gz"
)
sha256sums=("f6070d779fda6c551c8eb85e74867915e7ca55edb3e3039b5ac09ad649a538a0")

build() {
	cd $srcdir/$pkgname
	make MODE=release build
}

check() {
	cd $srcdir/$pkgname
	make lint
	make test
}

package() {
	cd $srcdir/$pkgname

	cp -arv root/* $pkgdir
	cp -arv arch/root/* $pkgdir

	chmod 750 $pkgdir/etc/sudoers.d

	# mkdir -p $pkgdir/usr/bin
	# cp -arv rust/target/release/my-sway $pkgdir/usr/bin/my-sway
}

