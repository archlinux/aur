# Maintainer: Taylor Allen
pkgname=shortsync-git
pkgver=1.r18.d7d8c33
pkgrel=1
epoch=
pkgdesc="This application makes it easy to keep track of alias, file, and folder shortcuts across multiple applications and shells."
arch=(x86_64 i686)
url="https://github.com/taylo2allen/shortsync.git"
license=('MIT')
groups=()
depends=()
makedepends=('git' 'glibc' 'gcc-libs' 'yaml-cpp')
checkdepends=()
optdepends=('entr')
provides=('shortsync')
conflicts=()
replaces=('shortsync')
backup=()
options=()
install=
changelog=
source=(git+$url)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd shortsync
	printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd shortsync
	make
}

package() {
	cd shortsync
	mkdir -p /home/$USER/.config/shortsync/shortcut-files/
	cp -nru config/* -t /home/$USER/.config/shortsync
	install -Dm755 "bin/shortsync" "$pkgdir/usr/local/bin/shortsync"
	install -Dm644 "shortsync.1" "$pkgdir/usr/share/man/man1/shortsync.1"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/shortsync/LICENSE"
	install -Dm644 "README.org" "$pkgdir/usr/share/doc/shortsync/README.org"
}
