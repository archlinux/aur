# Maintainer: Јован Ђокић-Шумарац <sumarac@protonmail.com>
pkgname=dwm-vojvoda-git
pkgver=6.2.r.
pkgrel=1
epoch=
pkgdesc="My build of dwm"
arch=(x86_64)
url="https://gitlab.com/vojjvoda/dwm"
license=('MIT')
groups=()
depends=(libxft-bgra-git ttf-hack ttf-joypixels nerd-fonts-mononoki picom-jonaburg-git xorg-xgamma clipmenu pulseeffects nitrogen brave-nightly-bin pavucontrol alacritty pulseaudio pulseaudio-ctl brightnessctl dmenu-vojvoda-git dwmblocks-vojvoda-git )
makedepends=(make)
checkdepends=()
optdepends=()
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
  cd "${_pkgname}"
  printf "6.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
	cd dwm
	make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}


package() {
  cd dwm  
  mkdir -p ${pkgdir}/opt/${pkgname}
  cp -rf * ${pkgdir}/opt/${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/dwm/dwm.desktop" "$pkgdir/usr/share/xsessions/dwm.desktop"
  
}


