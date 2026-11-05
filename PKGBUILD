# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=mediaboom-3
pkgver=2.0.3.0+1.0.0.0
pkgrel=1
pkgdesc="Cross-platform music and video player written in C#"
arch=('x86_64' 'aarch64')
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'tzdata' 'mpv')
makedepends=('git' 'dotnet-sdk-10.0' 'make' 'which' 'python-py7zr')
optdepends=('portaudio: PortAudio support for MediaBoom'
			'libpulse: PulseAudio support for MediaBoom')
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/MediaBoom#tag=v1.0.0")
sha256sums=('SKIP')

prepare() {
	cd "${pkgname}"
	make init-offline
	make clean
	git submodule update --init --remote
}

build() {
	cd "${pkgname}"
	make all-offline
}

package() {
	cd "${pkgname}"
	make install DESTDIR="$pkgdir"
}
