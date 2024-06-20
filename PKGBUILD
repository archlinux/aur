# Maintainer: system64 <system64fumo@protonmail>

pkgname=syshud
pkgver=0.1
pkgrel=1
pkgdesc="Simple heads up display written in gtkmm 4"
arch=(x86_64 aarch64)
url="https://github.com/System64fumo/syshud"
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/syshud")
sha256sums=('SKIP')

if pacman -Qs wireplumber >/dev/null; then
	depends+=('wireplumber')
	PULSEAUDIO=0
elif pacman -Qs libpulse >/dev/null; then
	depends+=('libpulse')
	PULSEAUDIO=1
else
	depends+=('wireplumber')
	PULSEAUDIO=0
fi

build() {
	cd "${pkgname}"
	make PULSEAUDIO=$PULSEAUDIO
}

package() {
	cd "${pkgname}"
	mkdir "${pkgdir}/usr"
	make DESTDIR="${pkgdir}/usr" PULSEAUDIO=$PULSEAUDIO install
}
