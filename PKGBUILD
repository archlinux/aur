# Maintainer: j.r <j.r@jugendhacker.de>
_pkgname=onedrive_tray
pkgname=$_pkgname-git
pkgver=r14.90313c0
pkgrel=1
pkgdesc="OneDrive system tray program"
arch=('i686' 'x86_64')
url="https://github.com/DanielBorgesOliveira/onedrive_tray"
license=('unknown')
depends=('qt5-base')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("onedrive_tray=$pkgver")
conflicts=("onedrive_tray")
source=('git+https://github.com/DanielBorgesOliveira/onedrive_tray.git')
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	rm -rf build && mkdir -p build
	cd build
	qmake ../systray.pro
	make
}

package() {
	cd "$_pkgname"
	mkdir -p "$pkgdir/usr/local/bin/"
	cp build/systray "$pkgdir/usr/local/bin/onedrive_tray"
}
