# Maintainer: Anish Vundela <anishreddyvundela@gmail.com>
pkgname=dwm-supermario9590-git
_pkgname=dwm
pkgver=r1685.61bb8b2
pkgrel=1
pkgdesc="My custom build of DWM"
arch=(x86_64 i686)
url="https://gitlab.com/supermario9590/dwm-supermario9590"
license=('MIT')
groups=()
depends=(libx11 libxinerama libxft nerd-fonts-mononoki ttf-symbola freetype2 st dmenu emacs)
makedepends=('git')
provides=(dwm)
conflicts=(dwm)
replaces=()
backup=()
options=()
install=
source=('dwm::git+https://git.suckless.org/dwm')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${_pkgname}"
	patch -p1 -i "../../dwm-supermario9590.diff"
}

build() {
	cd "$srcdir/${_pkgname}"
	make
}

package() {
	cd "$srcdir/${_pkgname}"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -m644 -D LICENSE "$pkgdir/usr/share/licences/$pkgname/LICENSE"
	install -m644 -D README "$pkgdir/usr/share/doc/$pkgname/README"
}
