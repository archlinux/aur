# Maintainer: Michael Paul <aur at michael-paul dot org>
# shellcheck disable=SC2034,SC2154,SC2164 shell=bash
pkgname='gnome-shell-extension-asdbctl-slider-git'
pkgver=r14.0d94c6b
pkgrel=1
pkgdesc="GNOME brightness slider for asdbctl"
_uuid="asdbctl-qs@flightmansam@me.com"
arch=("any")
url="https://github.com/flightmansam/gnome-asdbctl-slider"
license=('GPL')
depends=(asdbctl gnome-shell)
makedepends=(git)
options=(!debug)
source=("${pkgname}-${pkgver}::git+$url")
b2sums=('SKIP')

pkgver() {
	cd "${pkgname}-${pkgver}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	gnome-extensions pack -f "$_uuid"
}

package() {
	cd "$pkgdir"
	install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
	bsdtar -xvf "$srcdir/${pkgname}-${pkgver}/${_uuid}.shell-extension.zip" \
		-C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
	rm "$srcdir/${pkgname}-${pkgver}/${_uuid}.shell-extension.zip"
}
