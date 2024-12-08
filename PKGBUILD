# Maintainer: Popolon <popolon aL popolon.org>

_pkgname=VL1-emulator
pkgname=vl1-emulator-git
pkgver=r81.892545c
pkgrel=1
pkgdesc="An emulator of Casio VL-Tone VL1, based on source code by PolyValens"
arch=('i686' 'x86_64' 'riscv32' 'riscv64' 'armv7h' 'aarch64')
url="https://github.com/linuxmao-org/VL1-emulator"
license=('MIT' 'CC0')
depends=('pkgconf' 'libx11' 'cairo' 'jack' 'mesa')
conflicts=('vl1-emulator')
source=("git+https://github.com/linuxmao-org/${_pkgname}")
sha256sums=(SKIP)

pkgver() {
	cd "${srcdir}/${_pkgname}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	  git submodule update --init
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" PREFIX=/usr install

        install -Dm644 LICENSE.MIT LICENSE.CC0 -t "${pkgdir}"/usr/share/licenses/${pkgname}/
}
