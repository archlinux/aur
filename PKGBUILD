# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# PKGBUILD prototype location: /usr/share/pacman/PKGBUILD.proto
# Example: https://github.com/archlinuxarm/PKGBUILDs/blob/master/aur/libcrossguid-git/PKGBUILD

# Maintainer: Tech Guy Software <techguy100official at gmail dot com>
pkgname=clevo-indicator-git
pkgver=r17.fa0a7af
pkgrel=1
#epoch=
pkgdesc="Command-line fan control utility for Clevo laptops"
arch=('x86_64')
url="https://github.com/SkyLandTW/clevo-indicator"
license=('custom:Unlicense')
#groups=()
depends=('libappindicator-gtk3')
makedepends=('git')
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
source=("${pkgname%}::git+https://github.com/SkyLandTW/clevo-indicator.git")
md5sums=('SKIP')
#noextract=()
#validpgpkeys=()

pkgver() {
  cd "$srcdir"/$pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname"
	#./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
	echo "--> Moving files to /usr/bin..."
	sudo mv "/usr/local/bin/clevo-indicator" "/usr/bin/$pkgname"
	echo "--> Success! Run the fan control utility using the command \"clevo-indicator\" as the root user."
}

makepkgclean() {
    echo "--> Cleaning up files created by makepkg..."
    makepkg -code
    echo "--> Removing command-line script from directory..."
    cd "/usr/local/bin"
    sudo rm -rf "$pkgname"
}
