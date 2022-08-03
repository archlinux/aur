# Maintainer: Taylor Allen
pkgname=shortsync
pkgver=1.r7.f4ea3d5
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
	mkdir -p $HOME/.config/shortsync/
	chmod 755 config/*
	cp -nru config/* -t /$HOME/.config/shortsync
	# install -CDm755 config "$pkgdir$HOME/.config/shortsync/config"
	install -Dm755 bin/$pkgname "$pkgdir/usr/local/bin/$pkgname"
	install -Dm644 $pkgname.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.org "$pkgdir/usr/share/doc/$pkgname/README.org"
}
