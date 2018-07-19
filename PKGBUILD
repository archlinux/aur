# $Id$
# Maintainer: Gryffyn
# Orginal Arch Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: SleepyDog

pkgname=glew2.0
pkgver=2.0.0
pkgrel=1
pkgdesc="The OpenGL Extension Wrangler Library"
arch=('i686' 'x86_64')
url="http://glew.sourceforge.net"
license=('BSD' 'MIT' 'GPL')
depends=('libxmu' 'libxi' 'mesa' 'glew')
source=(http://downloads.sourceforge.net/glew/glew-2.0.0.tgz)
md5sums=('2a2cd7c98f13854d2fcddae0d2b20411')

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
