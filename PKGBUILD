# Maintainer: HabarNam <habarnam@gmail.com>
pkgname=orion-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=r214.5545bf1
pkgrel=1
pkgdesc="QML/C++-written desktop client for Twitch.tv"
arch=('x86_64' 'x86')
url="https://github.com/alamminsalo/orion"
license=('GPL')
groups=()
depends=('qt5-base' 'qt5-quickcontrols')
optdepends=('qtav: alternate video output', 'qt5-multimedia: alternate video output')
makedepends=('git' 'mpv' 'qt5-webengine' 'qt5-svg' 'libcommuni-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/alamminsalo/orion.git'
    'Orion.desktop'
)

noextract=()
sha256sums=('SKIP'
            'a0bb773176dd7ec448ecd5702da9c32b35da27ea3070b23496fe51abb15d8d44')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	qmake 
	make
}

package() {
    mkdir -p "$pkgdir/usr/share/icons"
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/bin"

	cp "$srcdir/${pkgname%-git}/orion.svg" "$pkgdir/usr/share/icons/" 
	cp "./Orion.desktop" "$pkgdir/usr/share/applications/"
	cp "$srcdir/${pkgname%-git}/orion" "$pkgdir/usr/bin/" 
}
