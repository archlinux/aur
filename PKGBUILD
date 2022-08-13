# Maintainer: Aditya Mishra <https://github.com/pegvin/goxel2/issues>
pkgname=csprite
pkgver=1.0.0
pkgrel=1 # Update if you changed something but that is so minor change you don't want to change the version
pkgdesc="a tiny pixel art editor"
arch=('x86_64')
url="https://github.com/pegvin/csprite"
license=('GPL3')
depends=(glfw gtk3)
makedepends=(git make scons pkg-config python-pillow python-numpy)
optdepends=()
provides=('csprite')
conflicts=('csprite' 'csprite-git' 'csprite-bin')

source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/pegvin/csprite/archive/refs/tags/v${pkgver}.tar.gz"
)

sha512sums=(
	85c09a15ab1ebca8210aee6481b23b9262bada2e70173ed058f56cbde9857c7220e16d0200da433093f76e2c9c64441d401913fb24e488c179c9af0881836f47
)

build() {
    cd "csprite-${pkgver}"
	make release
}

package() {
    cd "csprite-${pkgver}"
	install -Dm644 data/csprite.desktop "$pkgdir/usr/share/applications/csprite.desktop"
	install -Dm644 data/icon-512.png "$pkgdir/usr/share/icons/csprite.png"
	install -Dm755 csprite "$pkgdir/usr/bin/csprite"
}
