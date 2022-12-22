# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.9.1
_pkgver=0.9.1
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base' 'mangohud')
makedepends=('git' 'lazarus')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('vkbasalt: Configure vkBasalt'
            'mesa-utils: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution'
	    'breeze: Prefered choice for theme'
	    'oxygen: Backup choice for theme')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha512sums=('26feeba780f13b54630f1f19ab44da501aeb84409ebe47f7b044083416d7e3d5a8c3f639366e2eb8aee458a034cda2bf7a276eb00eb69db2bafdc17906c8ea75')

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
