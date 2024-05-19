# Maintainer: system64 <system64fumo@protonmail>

pkgname=sysvol
pkgver=0.1
pkgrel=1
pkgdesc="A basic GTK4 volume indicator"
arch=('any')
url="https://github.com/System64fumo/sysvol"
depends=('gtkmm-4.0' 'gtk4-layer-shell')
source=("git+https://github.com/System64fumo/sysvol")
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
