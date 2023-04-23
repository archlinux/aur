# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Sathya Pramodh <sathyapramodh17@gmail.com>
pkgname=resetti-git
_devbranch="next"
pkgver=0.4.0_devel.r373.874e15c
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
    cd resetti
    printf "$(cat .version)_devel.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd resetti
	make build
}

package() {
	cd resetti
	install -Dm0755 resetti "${pkgdir}/usr/bin/resetti"
	if ! [ -d ~/.local/share/resetti ]
	then
		mkdir -p ~/.local/share/resetti
	fi
	install -Dm0755 bench ~/.local/share/resetti/bench
	install -Dm0664 internal/res/scene-setup.lua ~/.local/share/resetti/scene-setup.lua
	install -Dm0664 internal/res/default.toml ~/.local/share/resetti/default.toml
}
