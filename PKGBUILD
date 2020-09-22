# Maintainer: Anish Vundela <anishreddyvundela@gmail.com>
pkgname=dwm-supermario9590-git
pkgver=6.2
pkgrel=1
pkgdesc="My custom build of suckless' DWM"
arch=('i686' 'x86_64')
url="https://gitlab.com/supermario9590/dwm-supermario9590"
license=('MIT')
groups=()
depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'st' 'dmenu' 'ttf-symbola' 'nerd-fonts-mononoki')
makedepends=('git')
provides=("dwm")
conflicts=("dwm")
replaces=()
backup=()
options=()
install=
source=("git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd dwm-supermario9590
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dwm-supermario9590
	make
}

package() {
	cd dwm-supermario9590
	mkdir -p ${pkgdir}/opt/${pkgname}/
	cp -rf * $pkgdir/opt/$pkgname/
	make DESTDIR=$pkgdir PREFIX=/usr install
	install -m644 -D LICENCE $pkgdir/usr/share/licences/$pkgname/LICENCE
	install -m644 -D README.md $pkgdir/usr/share/doc/$pkgname/README.md
}
