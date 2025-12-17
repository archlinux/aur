# Maintainer: Aptivi <ceo at aptivi dot anonaddy dot com>
pkgname=nitrocid-28
pkgver=4.0.28.44+0.2.0.0~rc
pkgrel=1
pkgdesc="Simulates our future-planned kernel"
arch=('x86_64' 'aarch64')
url="https://aptivi.github.io"
license=('GPL-3.0-or-later')
depends=('dotnet-runtime-10.0' 'tzdata')
makedepends=('git' 'dotnet-sdk-10.0' 'make' 'which')
optdepends=('jack2: Jack support for BassBoom addon'
			'portaudio: PortAudio support for BassBoom addon'
			'openal: OpenAL support for BassBoom addon'
			'sdl2: SDL support for BassBoom addon'
			'libpulse: PulseAudio support for BassBoom addon')
provides=("${pkgname}-git" "${pkgname}-lite" "${pkgname}-lite-git")
conflicts=("${pkgname}-git" "${pkgname}-lite" "${pkgname}-lite-git")
options=('!strip')
source=("${pkgname}::git+https://github.com/Aptivi/Nitrocid#tag=v0.2.0-rc")
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
