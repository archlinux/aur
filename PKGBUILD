# Maintainer: martadinata666 <martadinata666@gmail.com>

pkgname=compiz-core-git
pkgver=0.8.10.r6.gb1aea52
pkgrel=1
pkgdesc="This is the latest stable release of Compiz without DE deps"
url="http://git.northfield.ws/compiz/?p=compiz/core;a=summary"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'libice')
options=(!libtool !emptydirs)
conflicts=('compiz' 'compiz-core')
provides=("compiz-core=$pkgver")
source=(
	'git://northfield.ws/compiz/core'
)

sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/core"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^compiz.//g'
}

build()
{
  cd $srcdir/core

  ./autogen.sh \
	    --prefix=/usr \
	    --enable-shared \
	    --disable-gtk \
	    --enable-dbus \
	    --enable-dbus-glib \
	    --enable-librsvg \
	    --enable-glib \
	    --disable-gconf \
	    --disable-gnome \
	    --disable-gnome-keybindings \
	    --disable-metacity \
	    --disable-kde \
	    --disable-kde4 \
	    --disable-kconfig \
	    --disable-static \
	    --disable-inotify \
        
  make
}

package() {
  cd "$srcdir/core"
  make DESTDIR="$pkgdir" install
}
