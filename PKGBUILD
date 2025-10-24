# Maintainer: system64 <system64fumo@tuta.io>

pkgname=syshud
pkgver=9.9.9
pkgrel=9
pkgdesc="Simple heads up display"
arch=('aarch64' 'riscv64' 'x86_64')
url="https://github.com/System64fumo/syshud"
license=('GPL3')
groups=('sysshell')
depends=('gtkmm-4.0' 'gtk4-layer-shell' 'wireplumber')
source=("git+https://github.com/System64fumo/syshud")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	git show -s --format=%cd --date=format:%Y.%m.%d $(git rev-parse HEAD)
}

build() {
	cd "${pkgname}"
	make PULSEAUDIO=$PULSEAUDIO
}

package() {
	cd "${pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" PULSEAUDIO=$PULSEAUDIO install
}
