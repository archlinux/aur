# Maintainer:  Maxime Poulin <maxpoulin64@gmail.com>
# Contributor: xpander <xpander0@gmail.com>
pkgname=glxosd-git
_gitname=glxosd
pkgver=r32.9f216b2
pkgrel=1
pkgdesc="An OSD for OpenGL applications running under the X Window System. This allows you to monitor your framerate and hardware temperature in games on Linux!"
arch=('i686' 'x86_64')
url="https://github.com/nickguletskii/GLXOSD"
license=('GPL')
depends=('mesa' 'glu' 'fontconfig' 'freetype2' 'lm_sensors' 'libxext')
makedepends=('cmake' 'gcc' 'git' 'boost' 'libxnvctrl')
provides=('glxosd')
conflicts=('glxosd')
source=('git://github.com/nickguletskii/GLXOSD.git')
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


build() {
	cd "$srcdir/GLXOSD"
	cmake -DCMAKE_INSTALL_PREFIX=/usr -G "Unix Makefiles" 
	make all
}

package() {
    cd "$srcdir/GLXOSD"
    make DESTDIR="$pkgdir/" install
	sed -i 's+/usr//lib/x86_64-linux-gnu//glxosd/+/usr/lib/glxosd+g' $pkgdir/usr/bin/glxosd
	sed -i 's+/usr//lib/i386-linux-gnu//glxosd+/usr/lib/glxosd+g' $pkgdir/usr/bin/glxosd
}
