# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=soniccd-git
pkgver=r143.e0b421d
pkgrel=1
pkgdesc='A full decompilation of Sonic CD 2011, based on the PC remake with
improvements & tweaks from the mobile remakes.'
arch=('any')
url='https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation'
license=('reverse-engineered and unlicensed')
makedepends=('git')
depends=('sdl2' 'libogg' 'libtheora' 'libvorbis')
provides=(soniccd)
source=(
	"git+${url}.git"
	'soniccd-launcher'
	'soniccd.desktop')
sha256sums=(
	'SKIP'
	'55621606d74d3fa04d7ae0046ac88623648c587dae2b6addd1e081a587f6fe6d'
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
	cd "$srcdir/Sonic-CD-11-Decompilation"
	install -Dm755 soniccd "$pkgdir/usr/bin/soniccd"
}
