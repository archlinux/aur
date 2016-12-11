# Maintainer: Vittorio Gambaletta <archlinux@vittgam.net>

pkgname=mtrx-git
pkgver=r9.f20a87c
pkgrel=1
pkgdesc='Transmit and receive low-latency audio via UDP unicast or multicast, using the Opus codec.'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/VittGam/mtrx'
license=('GPLv3')
depends=('alsa-lib' 'opus')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname}::git+https://github.com/VittGam/mtrx.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}"
	make all
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}/" PREFIX="/usr" install
}
