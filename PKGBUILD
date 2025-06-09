# shellcheck shell=bash disable=SC2034 disable=SC2154
# Maintainer: Lucas Melo <luluco250 at gmail dot com>

_repo='https://github.com/orangepi-xunlong/firmware'
pkgname=aw87559-firmware
pkgver=20250609_db5e862
pkgrel=1
pkgdesc='Firmware for Awinic aw87559 audio device (taken from OrangePI firmware)'
arch=('x86_64')
license=('unknown')
_filename='aw87xxx_acf.bin'
source=(
	"$_filename::$_repo/raw/master/$_filename"
)
sha256sums=(
	'7db2c6eaca3135d732c2e635388e87cb49fc998b3f9a859c2a891ee78797eba3'
)

pkgver() {
	# Upstream seems to have no versioning system, so we'll just use the current
	# date + first 7 characters of the latest commit hash.
	printf '%s_%s' "$(date +%Y%m%d)" "$(git ls-remote "$_repo" HEAD | head -c 7)"
}

package() {
	install -Dm644 \
		"$srcdir/firmware/$_filename" \
		"$pkgdir/usr/lib/firmware/aw87559/$_filename"
	ln -sfT \
		"/usr/lib/firmware/aw87559/$_filename" \
		"$pkgdir/usr/lib/firmware/$_filename"
}
