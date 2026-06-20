# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=bassboom-3
pkgver=2.0.3.1+1.0.1
pkgrel=1
pkgdesc="Cross-platform music player written in C#"
arch=('x86_64' 'aarch64')
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'tzdata')
makedepends=('git' 'dotnet-sdk-10.0' 'make' 'which')
optdepends=('jack2: Jack support for BassBoom'
			'portaudio: PortAudio support for BassBoom'
			'openal: OpenAL support for BassBoom'
			'sdl2: SDL support for BassBoom'
			'libpulse: PulseAudio support for BassBoom')
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/BassBoom#tag=v1.0.1")
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
