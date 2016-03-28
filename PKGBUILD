# Maintainer: martadinata666 <martadinata666@gmail.com>

pkgname=compiz-core-git
pkgver=0.8.12.2.r1.g22d6319
pkgrel=1
pkgdesc="This is the latest stable release of Compiz without DE deps"
url="https://github.com/compiz-reloaded/compiz"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('startup-notification' 'librsvg' 'dbus' 'glu' 'libxslt' 'libxrandr' 'libsm' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'libice')
options=(!libtool !emptydirs)
conflicts=('compiz' 'compiz-core')
provides=("compiz-core=$pkgver")
source=(
	'git+https://github.com/compiz-reloaded/compiz'
)

sha1sums=('SKIP')

pkgver() {
  cd "${srcdir}/compiz"
  git describe --long --tags|sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build()
{
  cd "${srcdir}/compiz"

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
  cd "$srcdir/compiz"
  make DESTDIR="$pkgdir" install
}
