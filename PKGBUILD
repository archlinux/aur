# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=aw87559-firmware
pkgver=r81.f71b944
pkgrel=1
pkgdesc='Firmware for Awinic aw87559 audio device (taken from OrangePI firmware)'
arch=('x86_64')
license=('unknown')
_filename='aw87xxx_acf.bin'
source=(
	"git+https://github.com/orangepi-xunlong/firmware.git"
)
sha256sums=(
	'SKIP'
)

pkgver() {
	cd "$srcdir/firmware" || exit 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	install -Dm644 \
		"$srcdir/firmware/$_filename" \
		"$pkgdir/usr/lib/firmware/aw87559/$_filename"
	ln -sfT \
		"/usr/lib/firmware/aw87559/$_filename" \
		"$pkgdir/usr/lib/firmware/$_filename"
}
