# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_spirv_cross_commit='a090907607f91af3939fa4174067eb43c09247d4'

pkgname=crossc
pkgver=1.3.0
pkgrel=1
pkgdesc='Portable C wrapper for SPIRV-Cross'
arch=('i686' 'x86_64')
url='https://github.com/rossy/crossc/'
license=('unknown')
depends=('gcc-libs')
makedepends=('git')
conflicts=('crossc-git')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/rossy/crossc/archive/v${pkgver}.tar.gz"
        'SPIRV-Cross-git'::"git+https://github.com/KhronosGroup/SPIRV-Cross.git#commit=${_spirv_cross_commit}")
sha256sums=('fcbbc2e729ffafdae079bb3f04f4ce6818e100600d0cb82f35d6033e3f70dc85'
            'SKIP')

prepare() {
    cd "${pkgname}-${pkgver}"
    
    rm -rf SPIRV-Cross
    ln -sf "${srcdir}/SPIRV-Cross-git" SPIRV-Cross
}

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" prefix='/usr' install
}
