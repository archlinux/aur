# Maintainer: Esmail EL BoB <aur.valj8@simplelogin.co>

pkgname="wine-roblox-git" # '-bzr', '-git', '-hg' or '-svn'
pkgver=r.
pkgrel=1
pkgdesc="Wine-tkg with custom roblox mouse patch"
arch=('x86_64')
url="https://github.com/Frogging-Family/wine-tkg-git"
license=('GNU GPL V3')
makedepends=('git')
md5sums=()


pkgver() {
	mkdir "$pkgname"
	cd "$pkgname"
	( set -o pipefail
	  git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}


build() {
	cd "$pkgname"
	git clone --depth=1 https://github.com/Frogging-Family/wine-tkg-git.git .
	cd wine-tkg-git/
    sed 's/_community_patches=""/_community_patches="roblox_mouse_fix.mypatch"/' -i customization.cfg
	makepkg -si
}

package() {
	echo "Done -- now please update your system (sudo/doas pacman -Syyuu) and install roblox via grapejuice"

}
