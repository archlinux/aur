# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=arsdk3-samples-git
pkgver=r128.fc07c87
pkgrel=1
pkgdesc="ARSDK3 samples to control Parrot devices"
arch=(x86_64)
url="http://developer.parrot.com/"
license=('custom')
groups=()
depends=(libarsdk3-git)
optdepends=("mplayer: video playback"
			"xterm: video playback log")
makedepends=(git)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('arsdk-samples::git+https://github.com/Parrot-Developers/Samples'
        'BebopDroneDecodeStream-Makefile'
        'BebopDroneReceiveStream-Makefile'
        'BebopPilotingNewAPI-Makefile'
        'JSPilotingNewAPI-Makefile'
        'LICENSE')
sha256sums=('SKIP'
            'f0a72bb2e28c0fa32c6d751ff2f1985b23dac479d1e14a1faadba23eda2323d8'
            'ead92b4bb2d96e3b9e33d78a91b1255782edbb2cf324a6d3e3672213ce0a44c0'
            'acd467945f35f5c40f83adfa1359cdc6d9a7f61cff3ac7b6b0e9f10f6a12bb8e'
            'a908d8fd83f08a1b9b4c330227559d8aa1ac9d938a73ffc8d58ef67b55cff445'
            '1771e95329e9cb2bed04e023e330af3d558d0f13c0c1c5de0581f2880f149deb')

pkgver() {
	cd "$srcdir/arsdk-samples"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    # Copy Makefiles
    cp "$srcdir/BebopDroneDecodeStream-Makefile" "$srcdir/arsdk-samples/Unix/BebopDroneDecodeStream/Makefile"
    cp "$srcdir/BebopDroneReceiveStream-Makefile" "$srcdir/arsdk-samples/Unix/BebopDroneReceiveStream/Makefile"
    cp "$srcdir/BebopPilotingNewAPI-Makefile" "$srcdir/arsdk-samples/Unix/BebopPilotingNewAPI/Makefile"
    cp "$srcdir/JSPilotingNewAPI-Makefile" "$srcdir/arsdk-samples/Unix/JSPilotingNewAPI/Makefile"
}

build() {
	cd "$srcdir/arsdk-samples/Unix/BebopDroneDecodeStream"
	make
	cd "$srcdir/arsdk-samples/Unix/BebopDroneReceiveStream"
	make
	cd "$srcdir/arsdk-samples/Unix/BebopPilotingNewAPI"
	make
	cd "$srcdir/arsdk-samples/Unix/JSPilotingNewAPI"
	make
}

package() {
    mkdir -p "$pkgdir/usr/bin"
	cp "$srcdir/arsdk-samples/Unix/BebopDroneDecodeStream/BebopDroneDecodeStream" "$pkgdir/usr/bin"
	cp "$srcdir/arsdk-samples/Unix/BebopDroneReceiveStream/BebopDroneReceiveStream" "$pkgdir/usr/bin"
	cp "$srcdir/arsdk-samples/Unix/BebopPilotingNewAPI/BebopPilotingNewAPI" "$pkgdir/usr/bin"
	cp "$srcdir/arsdk-samples/Unix/JSPilotingNewAPI/JSPilotingNewAPI" "$pkgdir/usr/bin"

	# Install license
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
