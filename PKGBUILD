# Maintainer: Elara Musayelyan <elara@elara.ws>
pkgname=itgui-git
pkgver=r260.bec703c
pkgrel=1
pkgdesc="GUI client for ITD"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPLv3')
depends=('libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd' 'itd')
provides=('itgui')
conflicts=('itgui')
makedepends=('go' 'gcc' 'xorg-server-devel' 'libxcursor' 'libxrandr' 'libxinerama' 'libxi' 'libglvnd')
source=('git+https://gitea.elara.ws/Elara6331/itd.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/itd"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/itd"
	go build ./cmd/itgui
}

package() {
	cd "$srcdir/itd"
	install -Dm755 ./itgui "$pkgdir/usr/bin/itgui"
	install -Dm644 ./itgui.desktop "$pkgdir/usr/share/applications/itgui.desktop"
}
