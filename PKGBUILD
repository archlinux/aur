# Maintainer:  Michael Kogan <michael dot kogan at gmx dot net>

pkgname=jngl
pkgver=0.9.2
pkgrel=3
pkgdesc="One of the easiest 2D game libraries for C++ and Python"
arch=('i686' 'x86_64')
url="http://jngl.watteimdocht.de/"
license=('GPL3')
depends=('boost' 'freetype2' 'fontconfig' 'glib2' 'libjpeg6' 'libpng12' 'libvorbis' 'libxext' 'libxxf86vm' 'mesa' 'openal' 'python2')
makedepends=('scons' 'git')
source=('python27.patch')
md5sums=('58ec66f99186c5e491a4657559f203d1')
sha1sums=('61c55403238c7c7d95de87bb720230f47fd75a62')

build() {
	git clone https://github.com/jhasse/JNGL.git
	patch $srcdir/JNGL/SConstruct < python27.patch
	cd $srcdir/JNGL
	scons python=1|| return 1
	./install.sh $pkgdir/usr || return 1
	install -D -m644 "$srcdir/JNGL/python/libjngl.so" "${pkgdir}/usr/lib/python2.7/site-packages/jngl.so" || return 1
}
