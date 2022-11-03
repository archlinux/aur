# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=csprite
pkgver=0.1.0
pkgrel=1 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a tiny pixel art editor"
arch=('x86_64')
url="https://github.com/pegvin/csprite"
license=('MIT')
depends=(glfw gtk3)
makedepends=(git make scons pkg-config python-pillow python-numpy)
optdepends=()
provides=('csprite')
conflicts=('csprite' 'csprite-git' 'csprite-bin')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/pegvin/csprite/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
	e58752686d830429ad35024a56bb68f45e6009b6a45044bda11a0f536f193e19f9b035b3908e3dc369faf90e5cfffe3b43206b6150be067f96c21bebd057e73e
)

build() {
    cd "csprite-${pkgver}"
	make generate
	make release
}

package() {
    cd "csprite-${pkgver}"
	install -Dm644 data/csprite.desktop "$pkgdir/usr/share/applications/csprite.desktop"
	install -Dm644 data/icon-512.png "$pkgdir/usr/share/icons/csprite.png"
	install -Dm755 csprite "$pkgdir/usr/bin/csprite"
}
