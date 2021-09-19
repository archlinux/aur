# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

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
	thunar
	thunar-archive-plugin
	thunar-media-tags-plugin
	thunar-volman
	tumbler
	xfce4-battery-plugin
	xfce4-datetime-plugin
	xfce4-power-manager
	xfce4-pulseaudio-plugin
	xfce4-settings
	xfce4-xkb-plugin
	xfconf
	xfce4-notifyd
)

pkgname=dots-git
pkgver=1.0.r327.877790f
pkgrel=1
epoch=
pkgdesc="Dotfiles generator that allows quick configuration and managing of different tools and window managers in multiple OSs"
arch=(x86_64 i686)
url="https://github.com/ulises-jeremias/dotfiles"
license=('MIT')
groups=()
depends=( git "${fonts[@]}" "${needed_pkgs[@]}" "${xfce4_pkgs[@]}")
makedepends=()
checkdepends=()
optdepends=()
provides=(dots)
conflicts=(dots)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd ./dotfiles || exit
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ./dotfiles || exit
	rm -rf "${pkgdir}"/opt/"${pkgname}"
	mkdir -p "${pkgdir}"/opt/"${pkgname}"
	cp -Rf ./* "${pkgdir}"/opt/"${pkgname}"
	install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
	install -Dm644 README.md "${pkgdir}"/usr/share/doc/"${pkgname}"/README.md
	cp -Rf arch-linux "${pkgdir}"/opt/"${pkgname}"
	cp -Rf common "${pkgdir}"/opt/"${pkgname}"
	cp -Rf default-config "${pkgdir}"/opt/"${pkgname}"
	cp -Rf scripts "${pkgdir}"/opt/"${pkgname}"
	cp -Rf util "${pkgdir}"/opt/"${pkgname}"
	install -Dm755 dots "${pkgdir}"/usr/bin/dots
}
