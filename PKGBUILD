# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# The following guidelines are specific to BZR, GIT, HG and SVN packages.
# Other VCS sources are not natively supported by makepkg yet.

# Maintainer: Anish Vundela <anishreddyvundela@gmail.com>
pkgname=dmenu-supermario9590-git
_pkgname=dwm
pkgver=r573.1a13d04
pkgrel=1
pkgdesc="My custom build of suckless' dmenu"
arch=(i686 x86_64)
url="gitlab.com/supermario9590/dmenu-supermario9590.git"
license=('MIT')
groups=()
depends=(nerd-fonts-mononoki ttf-symbola)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=()
backup=()
options=()
install=
source=('dwm::git+http://git.suckless.org/dmenu')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/$_pkgname"
	patch -p1 -i ../../dmenu-supermario9590.diff
}

build() {
	cd "$srcdir/$_pkgname"
	make
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr" install
}
