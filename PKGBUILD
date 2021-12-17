# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.7.1
_pkgver=0.7.1
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base' 'mangohud' 'breeze')
makedepends=('git' 'lazarus')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('vkbasalt: Configure vkBasalt'
            'mesa-utils: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha512sums=('15bd8a70a611a018374401b9f3c97900371727f93d2edbe1f59a39e7da498315a811a4e4b9c2e44a63674ae55b5d6afb7e57e50abd234ffa98964eae5d24f92a')


build() {
	cd "$srcdir/$pkgname-$_pkgver"
	make LAZBUILDOPTS=--lazarusdir=/usr/lib/lazarus
}

check() {
	cd "$srcdir/$pkgname-$_pkgver"
	make tests
}

package() {
	cd "$srcdir/$pkgname-$_pkgver"
	make prefix=/usr libexecdir=/lib DESTDIR="$pkgdir/" install
}
