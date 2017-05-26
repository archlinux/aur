# Maintainer: dianlujitao <dianlujitao at gmail dot com>
pkgname=onscripter-jh
_pkgname=jh10001-onscripter-jh
pkgdesc="onscripter fork with custom improvements."
pkgver=0.7.3
pkgrel=1
_commit=e0eaf62c1cd6
arch=('i686' 'x86_64' 'armv7h')
url="https://bitbucket.org/jh10001/onscripter-jh"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_ttf' 'sdl2_image' 'libjpeg-turbo' 'bzip2' 'libvorbis' 'lua')
makedepends=('gcc')
conflicts=('onscripter-jh-hg')
provides=('onscripter-jh-hg')
source=("https://bitbucket.org/jh10001/onscripter-jh/get/SDL2.zip"
        "target.patch")
sha256sums=('6f0c6495c72477af2d52d64182b964aa567db9bb8729f5cf03e0b29b40c70ace'
            'd169f6ec66c70429bce973be76f77c8ae05ecaead30e1586e5f68e284dfc4b94')

prepare() {
    cd ${srcdir}/${_pkgname}-${_commit}
    patch -p1 < ${srcdir}/target.patch
}

build() {
    cd ${srcdir}/${_pkgname}-${_commit}
    make -f Makefile.Linux
}

package() {
	cd ${srcdir}/${_pkgname}-${_commit}
	install -Dm 755 ${srcdir}/${_pkgname}-${_commit}/onscripter ${pkgdir}/usr/bin/onscripter-jh
}
