# Maintainer: Anish Vundela <anishreddyvundela@gmail.com>
pkgname=dmenu-supermario9590-git
_pkgname=dmenu
pkgver=r573.1a13d04
pkgrel=1
pkgdesc="My custom build of suckless' dmenu"
arch=(i686 x86_64)
url="https://gitlab.com/supermario9590/dmenu-supermario9590.git"
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
source=('dmenu::git+http://git.suckless.org/dmenu')
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
	install -m644 -D LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"
	install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}
