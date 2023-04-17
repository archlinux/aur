# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sathya Pramodh <sathyapramodh17@gmail.com>
pkgname=resetti-git
_devbranch="next"
pkgver=0.4.0_devel
pkgrel=1
pkgdesc="resetti is a Linux-compatible reset macro for Minecraft speedruns. It supports
a variety of different resetting styles, categories, and Minecraft versions."
arch=('x86_64' 'i686')
url="https://www.github.com/woofdoggo/resetti"
license=('GPL3')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
optdepends=()
provides=()
conflicts=('resetti')
replaces=()
backup=()
options=()
source=("git+$url#branch=$_devbranch")
noextract=()
md5sums=('SKIP')
validategpgkeys=()

pkgver(){
	echo $(cat resetti/.version)_devel
}

build() {
	cd resetti
	make build
}

package() {
	cd resetti
	install -Dm0755 resetti "{$pkgdir}/usr/bin/resetti"
	if ! [ -d ~/.config/resetti ]
	then
		mkdir -p ~/.config/resetti
	fi
	install -Dm0664 bench ~/.config/resetti/bench
	install -Dm0664 scene-setup.lua ~/.config/resetti/scene-setup.lua
	install -Dm0664 internal/cfg/default.toml ~/.config/resetti/default.toml
}
