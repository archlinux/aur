# Maintainer: Aleksey Stepanov <blueingreen@bluig.space>

_pkgname=swob
pkgname="${_pkgname}-git"
pkgver=r24.7156e9f
pkgrel=1
pkgdesc="Volume and brightness controls for wayland, using wob"
arch=('any')
url="https://git.sr.ht/~blueingreen/swob"
makedepends=('git')
depends=('sh' 'coreutils' 'sed' 'wob' 'alsa-utils' 'brightnessctl')
optdepends=('wireplumber: wpctl, for pipewire support' 'libpulse: pactl, for pulseaudio support')
license=(GPL-3.0-or-later)
provides=(swob)
source=("${_pkgname}::git+https://git.sr.ht/~blueingreen/swob")
b2sums=(SKIP)

pkgver() {
	cd "${_pkgname}"
	(
		set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

package() {
	cd "${_pkgname}"

	DESTDIR="$pkgdir" ./install.sh
}
