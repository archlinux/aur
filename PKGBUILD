# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

_srcname=vmaf-git
pkgname=libvmaf-git
pkgver=1.3.1.r38.gfa8fc43
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
    make INSTALL_PREFIX='/usr' all
}

package() {
    cd "${_srcname}"
    make DESTDIR="$pkgdir" INSTALL_PREFIX='/usr' install
}
