# Maintainer: martadinata666 <martadinata666@gmail.com>

pkgname=compiz-core
pkgver=0.8.12
pkgrel=1
pkgdesc="This is the latest stable release of Compiz without DE deps"
url="http://blog.northfield.ws/compiz-0-8-12-release-announcement/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'gconf' 'libice')
options=(!libtool !emptydirs)
conflicts=('compiz' 'compiz-core' 'compiz-core-git' 'compiz-git')
provides=("compiz-core=$pkgver")
source=("compiz-core-${pkgver}.tar.xz::http://www.northfield.ws/projects/compiz/releases/${pkgver}/core.tar.xz")

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

sha256sums=('ea558a7c55d8097bd39ecbc8d98dc8dde989eb12612d88472435fafa34ecd3d8')
