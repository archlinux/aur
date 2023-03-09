# Maintainer: MaximMaximS <sklenicka dot maxim at gmail dot com>

pkgname=ast-fw
pkgver=1.1.6
pkgrel=1
pkgdesc="Firmware for ast kernel module"
arch=('any')
url="https://gitlab.freedesktop.org/xorg/driver/xf86-video-ast/-/blob/master/src/ast_dp501fw.h"
license=('MIT')
makedepends=('grep' 'sed' 'xxd')
source=("https://gitlab.freedesktop.org/xorg/driver/xf86-video-ast/-/raw/master/src/ast_dp501fw.h")
sha256sums=("587bd5750530946a633782a33146086ec97086427860b0516e243d9bd8bdfdaa")

build() {
	grep ^0x ast_dp501fw.h  | sed -e 's|,};$$|,|' | xxd -r -p - ast_dp501_fw.bin
}

package() {
	install -Dm644 $srcdir/ast_dp501_fw.bin $pkgdir/usr/lib/firmware/ast_dp501_fw.bin
}
