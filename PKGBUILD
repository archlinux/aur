# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=soniccd-git
pkgver=r281.129cd86
pkgrel=1
pkgdesc='A full decompilation of Sonic CD 2011, based on the PC remake with
improvements & tweaks from the mobile remakes.'
arch=('any')
url='https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation'
license=('custom:RSDKv3/4 Decompilation Source Code License v1')
makedepends=('git')
depends=('sdl2' 'libogg' 'libtheora' 'libvorbis')
provides=(soniccd)
source=(
	"git+${url}.git"
	'soniccd-launcher'
	'soniccd.desktop')
sha256sums=(
	'SKIP'
	'83b086300728ae627907ac042ded29ff5d00077261ebcdf3c5c93da6b1350a0e'
	'5ef3e25f5391707fdc461a8c25817ddde38a1d34d125dc5b3c43f706b889ed8a')
install=soniccd.install

pkgver() {
	cd "$srcdir/Sonic-CD-11-Decompilation"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/Sonic-CD-11-Decompilation"
	make ${MAKEFLAGS:--j$(nproc)}
}

package() {
	install -Dm755 soniccd-launcher "$pkgdir/usr/bin/soniccd-launcher"
	install -Dm644 soniccd.desktop "$pkgdir/usr/share/applications/soniccd.desktop"
	cd "$srcdir/Sonic-CD-11-Decompilation/bin"
	install -Dm755 soniccd "$pkgdir/usr/bin/soniccd"
	install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
