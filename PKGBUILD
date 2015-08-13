# Maintainer: martadinata666 <martadinata666@gmail.com>

pkgname=compiz-core
pkgver=0.8.10
pkgrel=1
pkgdesc="This is the latest stable release of Compiz without DE deps"
url="http://blog.northfield.ws/compiz-0-8-10-release-announcement/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'gconf' 'libice')
options=(!libtool !emptydirs)
conflicts=('compiz' 'compiz-core' 'compiz-core-git' 'compiz-git')
provides=("compiz-core=$pkgver")
source=(http://www.northfield.ws/projects/compiz/releases/${pkgver}/core.tar.gz)

md5sums=('a502e17eb7f61c5c66ec889c019a1f62')

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
