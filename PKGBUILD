# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=crossc-git
_srcname=crossc
pkgver=1.6.0.r0.g98689d7
pkgrel=2
pkgdesc='Portable C wrapper for SPIRV-Cross (git version)'
arch=('i686' 'x86_64')
url='https://github.com/rossy/crossc/'
license=('APACHE')
depends=('gcc-libs')
makedepends=('git')
provides=('crossc')
conflicts=('crossc')
source=('git+https://github.com/rossy/crossc.git'
        'git+https://github.com/KhronosGroup/SPIRV-Cross.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
    cd "$_srcname"
    
    git submodule init
    git config --local 'submodule.SPIRV-Cross.url' "${srcdir}/SPIRV-Cross"
    git submodule update
}

pkgver() {
    cd "$_srcname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "$_srcname"
    
    make
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" prefix='/usr' install
}
