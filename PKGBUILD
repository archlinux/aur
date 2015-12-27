# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Lara Maia <lara@craft.net.br>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: josephgbr <rafael.f.f1 at gmail dot com>

pkgname=glew1.5
pkgver=1.5.8
pkgrel=5
pkgdesc="Legacy version of the OpenGL Extension Wrangler Library"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/glew/"
license=(BSD MIT GPL)
depends=(glew)
source=(http://downloads.sourceforge.net/glew/glew-$pkgver.tgz)
md5sums=('342c8dc64fb9daa6af245b132e086bdd')

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
