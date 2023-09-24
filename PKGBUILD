# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=magickcache-git
pkgver=0.9.2.1.r68.gad6c528
pkgrel=1
pkgdesc='A digital media repository (git version)'
arch=('x86_64')
url='https://github.com/ImageMagick/MagickCache/'
license=('custom')
depends=('imagemagick')
makedepends=('git' 'opencl-headers')
provides=('magickcache')
conflicts=('magickcache')
source=('git+https://github.com/ImageMagick/MagickCache.git')
sha256sums=('SKIP')

prepare() {
    autoreconf -fi MagickCache
}

pkgver() {
    git -C MagickCache describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd MagickCache
    ./configure --prefix='/usr'
    make
}

package() {
    make -C MagickCache DESTDIR="$pkgdir" install
    install -D -m644 MagickCache/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
