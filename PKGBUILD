# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=goverlay
pkgver=0.7.0
_pkgver=0.7
pkgrel=1
pkgdesc="A GUI to help manage Vulkan/OpenGL overlays"
arch=('x86_64')
url="https://github.com/benjamimgois/goverlay"
license=('GPL3')
depends=('qt5pas' 'qt5-base' 'mangohud')
makedepends=('git' 'lazarus' 'qt5-base')
checkdepends=('appstream' 'desktop-file-utils')
optdepends=('vkbasalt: Configure vkBasalt'
            'mesa-utils: OpenGL preview'
            'vulkan-tools: Vulkan preview'
            'git: Clone reshade repository'
            'replay-sorcery: Instant replay solution')
conflicts=("${pkgname%-git}" "${pkgname%-bin}")
source=("${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha512sums=('ab30c5ebfed568801a9e5f89ce3700c738aaee51ad8be451a2b08cddabe7c81e9faaeff51c1c45afe0fedbbc0e41682d053b7c274b2b7a055084637412779524')

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
	make prefix=/usr DESTDIR="$pkgdir/" install
}
