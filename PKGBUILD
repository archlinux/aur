pkgver=1.9.2
pkgname=librga-multi
pkgrel=1
pkgdesc='Rockchip RGA User-Space Library'
arch=('aarch64' 'armv7h')
url='https://github.com/JeffyCN/mirrors/tree/linux-rga-multi'
license=('Apache')
depends=('gcc-libs' 'meson')
makedepends=('meson')
source=("${pkgname}-${pkgver}".tar.gz::"https://github.com/JeffyCN/mirrors/archive/f06fe38a77abc45355d896b2ee713c239618fc06.tar.gz")
sha256sums=('459136cf80d922e963467fc7953cbe6715d7b8394156bfaf36ebee236ebb328a')
options=(!lto debug strip)

build() {
    cd mirrors-*
    meson setup --reconfigure builddir --prefix="$pkgdir/usr"
    ninja -j$(nproc) -C builddir
}

package() {
  	provides=($pkgname)
  	conflicts=($pkgname rga librga)
  	cd mirrors-*
  	ninja -C builddir install
}