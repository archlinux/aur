# Maintainer: Alexandre Iooss <alexandre.iooss@gmail.com>

pkgname=arsdk3-samples-git
pkgver=r128.fc07c87
pkgrel=2
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
            '6e84ed30453752775e5895987e430d7fa2a2d2c166b75d58e2cf70637b2f750d'
            '248e18fd51b1e6f847dfee2804ee765ec59a8356d922af49f6689af2b1847303'
            '18f44c156c25d4a3477f20c51264a326e2b0c20de270b2db8b448dd422ef0af7'
            '444e5c3c497615b6198c0c879d87c6629fc373ee5d1828d9f9545a0bf5eb476d'
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
