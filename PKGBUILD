# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: maksim Kononykhin <kononelder@gmail.com>
pkgname=trackpointsound
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="adds the ability to play sound when you touch a trackpoint"
arch=("x86_64")
url="https://github.com/WindowsKonon1337/TrackPointSound"
license=('MIT')
groups=()
depends=("sfml")
makedepends=("cmake" "base-devel")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/WindowsKonon1337/TrackPointSound.git")

noextract=()
sha256sums=('de70466749f0391b549bea9303458092aa849555d404be0f277a7f6ddd0b1811')
validpgpkeys=()

prepare() {
	mkdir "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	git clone $source

	cd ./TrackPointSound/TrackpointSound
	mkdir -p "$HOME/.trackpointsound/audio/"
	install -Dm644 ./audio/* "$HOME/.trackpointsound/audio/"

	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver/TrackPointSound"
	cmake -B ../build -S .
	cd ../build/TrackpointSound
	make
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
    cd "$pkgname-$pkgver"/build/TrackpointSound
	install -Dm755 TrackpointSound "$pkgdir/usr/bin/trackpointsound"
}
