# Maintainer: j.r <j.r@jugendhacker.de>
# Contributor: Adrián Insaurralde <adrianinsaval at gmail dot com>

_pkgname=onedrive_tray
pkgname=$_pkgname-git
pkgver=r28.6883538
pkgrel=1
pkgdesc="OneDrive system tray program"
arch=('i686' 'x86_64')
url="https://github.com/DanielBorgesOliveira/onedrive_tray"
license=('unknown')
depends=('qt5-base' 'onedrive')
makedepends=('git') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("onedrive_tray=$pkgver")
conflicts=("onedrive_tray")
source=('git+https://github.com/DanielBorgesOliveira/onedrive_tray.git'
	'0001-Fix-binary-location-to-usr-bin.patch')
md5sums=('SKIP'
         'dad2a29aa7d4eacb4ee9dad0bfaa8eb5')

pkgver() {
	cd "$_pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
	cd "$_pkgname"

	patch -p1 -i "$srcdir/0001-Fix-binary-location-to-usr-bin.patch"
}

build() {
	cd "$_pkgname"
	rm -rf build && mkdir -p build
	cd build
	qmake ../systray.pro
	make
}

package() {
	cd "$_pkgname/build"
	make INSTALL_ROOT="${pkgdir}" install
}
