# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=vmaf-git
pkgname=libvmaf-git
pkgver=1.2.0.r101.g73d3e8e
pkgrel=1
pkgdesc='Library for perceptual video quality assessment based on multi-method fusion (git version)'
arch=('i686' 'x86_64')
url='https://github.com/netflix/vmaf/'
license=('APACHE')
makedepends=('git')
provides=('libvmaf')
conflicts=('libvmaf')
source=("${_srcname}"::"git+https://github.com/Netflix/${_srcname%-git}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_srcname}"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${_srcname}"
    msg2 "Building target 'all'..." && make all
    msg2 "Building target 'lib'..." && make lib
}

package() {
    cd "${_srcname}"
    make DESTDIR="$pkgdir" PREFIX='/usr' install
}
