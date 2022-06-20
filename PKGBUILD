# Maintainer: Ulises Jeremias Cornejo Fandos <ulisescf.24@gmail.com>
# Maintainer: Federico Ramon Gasquez <federicogasquez@gmail.com>
# Maintainer: Maria Macarena Lindo Poisson <maquipoisson@gmail.com>

fonts=(
	nerd-fonts-hack
	noto-fonts
	noto-fonts-cjk
	noto-fonts-emoji
	noto-fonts-extra
)

# Needed apps, themes and icons
needed_pkgs=(
	alacritty
	arc-gtk-theme
	arandr
	dbus-python
	feh
	graphicsmagick
	i3lock-fancy
	jgmenu
	jq
	networkmanager-dmenu
	network-manager-applet
	numix-icon-theme
	pacman-contrib
	pamixer
	pavucontrol
	playerctl
	polybar
	pulseaudio
	python-pywal
	rofi
	scrot
	skippy-xd
	sxiv
	# termite
	wmctrl
	xdotool
	xgetres
	yad
	zsh
	zsh-syntax-highlighting-git
)

# xfce4 utils
xfce4_pkgs=(
	exo
	libxfce4ui
	libxfce4util
	xfce4-settings
	xfce4-xkb-plugin
	xfconf
	xfce4-notifyd
)

pkgname=dots-git
pkgver=1.0.11.r31.gb444e44
pkgrel=1
pkgdesc="Dotfiles generator that allows quick configuration and managing of different tools and window managers in multiple OSs"
arch=(any)
url="https://github.com/ulises-jeremias/dotfiles"
license=('MIT')
depends=(git "${fonts[@]}" "${needed_pkgs[@]}" "${xfce4_pkgs[@]}")
optdepends=(
	"bluez: Daemons for the bluetooth protocol stack. Needed for the bluetooth integration in polybar"
	"blueman: GTK+ Bluetooth Manager. Optional."
	"dunst: Customizable and lightweight notification-daemon. Will be used by default for notifications if installed"
	"thunar: Modern file manager for Xfce"
	"thunar-archive-plugin: Create and extract archives in Thunar"
	"thunar-media-tags-plugin: Adds special features for media files to the Thunar File Manager"
	"thunar-volman: Automatic management of removeable devices in Thunar"
	"xfce4-power-manager: Power manager for the Xfce4 desktop"
	"xfce4-screenshooter: An application to take screenshots"
)
provides=(dots dots-scripts)
conflicts=(dots dots-scripts)
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd dotfiles || exit 1
	git fetch --tags
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd dotfiles || exit 1
	PKGNAME=dots
	PKGDIR="${pkgdir}"
	export PKGDIR PKGNAME
	sudo ./install
}
