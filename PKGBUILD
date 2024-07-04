# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=quirc-git
pkgver=1.2.r3.gfd13bfb
pkgrel=1
pkgdesc='QR decoder library (git version)'
arch=('x86_64')
url='https://github.com/dlbeer/quirc/'
license=('ISC')
depends=('libjpeg' 'libpng' 'sdl_gfx' 'sdl12-compat' 'v4l-utils')
makedepends=('git')
provides=('quirc')
conflicts=('quirc')
source=('git+https://github.com/dlbeer/quirc.git')
sha256sums=('SKIP')

pkgver() {
    git -C quirc describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    CFLAGS+=' -fPIC' make -C quirc libquirc.so quirc-demo quirc-scanner
}

package() {
    install -d -m755 "${pkgdir}/usr"/{bin,include,lib}
    make -C quirc DESTDIR="$pkgdir" PREFIX='/usr' install
    install -D -m644 quirc/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
