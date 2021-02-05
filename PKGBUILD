# Maintainer: xpt <user.xpt@gmail.com>
pkgname=glew2.0
pkgver=2.0.0
pkgrel=2
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'mesa' 'glew')
source=(http://downloads.sourceforge.net/glew/glew-2.0.0.tgz)
md5sums=('b2ab12331033ddfaa50dc39345343980')

prepare() {
	cd "$srcdir"/glew-$pkgver/
	sed -i 's|lib64|lib|' config/Makefile.linux
	make clean
}

build() {
    cd "$srcdir"/glew-$pkgver/
    make
}

package() {
    cd "$srcdir"/glew-$pkgver/

    # We want only these two libraries
    strip -x lib/libGLEW.so.$pkgver
    install -Dm644 lib/libGLEW.so.$pkgver "$pkgdir"/usr/lib/libGLEW.so.$pkgver
    ln -sf libGLEW.so.$pkgver "$pkgdir"/usr/lib/libGLEW.so.1.5
    chmod 755 "$pkgdir"/usr/lib/libGLEW.so.$pkgver
}
