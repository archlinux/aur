# Contributor: Alejandro Perez Mendez <alejandro.perez.mendez@gmail.com>

_pkgname=xfce4-notifyd
pkgname=xfce4-notifyd-keyaction
pkgver=0.4.4
pkgrel=1
pkgdesc="Notification daemon for the Xfce desktop. Super+N executes the first action"
arch=('i686' 'x86_64')
url="https://goodies.xfce.org/projects/applications/xfce4-notifyd"
license=('GPL2')
groups=('xfce4-goodies')
depends=('libxfce4ui' 'libnotify' 'hicolor-icon-theme' 'libkeybinder3')
makedepends=('intltool')
conflicts=('xfce4-notifyd')
provides=('xfce4-notifyd' 'notification-daemon')
source=(https://archive.xfce.org/src/apps/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2
        keybinder.patch)
sha256sums=('090571acf94c423003426cb779fb23e8545c68bab6485563b589c7def8a21b55'
            '9fb16fe3806dc985b51002f13ac96c940252609b98b4f6a2647a7a01bf768f80')


prepare() {
  cd "$_pkgname-$pkgver"
  patch -Np1 -i ../keybinder.patch
}

build() {
  cd "$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

