# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

pkgname=crossc-git
pkgver=1.0.0.r2.g1b9df97
pkgrel=1
pkgdesc='Portable C wrapper for SPIRV-Cross (git version)'
arch=('i686' 'x86_64')
url='https://github.com/rossy/crossc/'
license=('unknown')
depends=('gcc-libs')
makedepends=('git')
provides=('crossc')
conflicts=('crossc')
source=("$pkgname"::'git+https://github.com/rossy/crossc.git'
        'SPIRV-Cross'::'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$pkgname"
    
    git submodule init
    git config --local 'submodule.SPIRV-Cross.url' "${srcdir}/SPIRV-Cross"
    git submodule update
}

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" prefix='/usr' install
}
