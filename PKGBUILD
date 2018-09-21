# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_spirv_cross_commit='bfbe36f6362fa277aa0f966e35927c9aedd60d01'

pkgname=crossc
pkgver=1.5.0
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
sha256sums=('386dbc6829c370bfc7934fd5501fac0715aa2e08fd615dff6f5c90e41e2518ef'
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
