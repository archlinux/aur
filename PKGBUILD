# Maintainer: Alexander Epaneshnikov <aarnaarn2@gmail.com>
# Contributor: Jeremiah Ticket <seashellpromises@gmail.com>
# Contributor: Storm Dragon <stormdragon2976@gmail.com>

pkgname=espeakup-git
pkgver=0.90.r5.ge858481
pkgrel=1
pkgdesc="Allows the Speakup screen review system to use the espeak-ng synthesizer (development version)"
arch=('x86_64')
url="https://github.com/linux-speakup/espeakup"
license=('GPL3')
depends=('alsa-lib' 'espeak-ng')
makedepends=('git' 'ruby-ronn-ng' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(${pkgname%-git}::'git+https://github.com/linux-speakup/espeakup.git')
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	# cutting off 'v' prefix that presents in the git tag
	printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
	cd "${pkgname%-git}"
	arch-meson . build
	ninja -C build
}

package() {
	cd "${pkgname%-git}"
	DESTDIR="$pkgdir" ninja install -C build
}
