# Maintainer: Lucas Melo <luluco250 at gmail dot com>

pkgname=soniccd-git
pkgver=r423.f0d510c
pkgrel=1
pkgdesc='A full decompilation of Sonic CD 2011, based on the PC remake with
improvements & tweaks from the mobile remakes.'
arch=('any')
url='https://github.com/Rubberduckycooly/Sonic-CD-11-Decompilation'
license=('custom:RSDKv3/4 Decompilation Source Code License v1')
makedepends=('git')
depends=('sdl2' 'libogg' 'libtheora' 'libvorbis' 'tinyxml2')
provides=(soniccd)
source=(
	"git+${url}.git"
	'soniccd-launcher'
	'soniccd.desktop'
)
sha256sums=(
	'SKIP'
	'b70b6526c137859385234a19d1935e089c3c6a71639f42f7d579135579e8243b'
	'5ef3e25f5391707fdc461a8c25817ddde38a1d34d125dc5b3c43f706b889ed8a'
)
install=soniccd.install

pkgver() {
	cd "$srcdir/Sonic-CD-11-Decompilation"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/Sonic-CD-11-Decompilation"
	make ${MAKEFLAGS:--j$(nproc)} # CXXFLAGS=O2
}

package() {
	install -Dm755 soniccd-launcher "$pkgdir/usr/bin/soniccd-launcher"
	install -Dm644 soniccd.desktop "$pkgdir/usr/share/applications/soniccd.desktop"
	cd "$srcdir/Sonic-CD-11-Decompilation/bin"
	install -Dm755 RSDKv3 "$pkgdir/usr/bin/RSDKv3"
	install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
