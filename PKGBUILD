# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Luciano A. Ferrer <laferrer@gmail.com>

pkgname=byzanz
pkgver=0.3.0.1
pkgrel=1
pkgdesc="Record what's happening on your desktop"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/byzanz/"
license=('GPL')
depends=('gtk3' 'gst-plugins-base')
makedepends=('git' 'gnome-common' 'gnome-panel' 'intltool')
optdepends=('gnome-panel: panel applet')
install=$pkgname.install
source=(git://git.gnome.org/byzanz#commit=78fb3de3
        0001-Port-to-libpanel-applet-5.patch
        flv-audio.patch)
md5sums=('SKIP'
         '39e44b82a042a07349997f5847e780ee'
         '1150232a7a49cf3748b8b7fe8a90fae1')

prepare() {
  cd $pkgname

  # Port to libpanel-applet 5
  patch -Np1 -i ../0001-Port-to-libpanel-applet-5.patch

  # Fix flv audio
  patch -Np1 -i ../flv-audio.patch
}

build() {
  cd $pkgname

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
               --disable-schemas-compile
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
