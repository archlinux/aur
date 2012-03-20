# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=cheese
pkgver=3.3.92
pkgrel=1
pkgdesc="Use your webcam to take photos and videos, apply fancy special effects and share the fun with others"
arch=(i686 x86_64)
license=('GPL')
depends=('gnome-desktop' 'gtk3' 'libcanberra' 'librsvg' 'gstreamer0.10-base-plugins'
         'gstreamer0.10-good-plugins' 'gstreamer0.10-bad' 'clutter-gst' 'clutter-gtk' 'mx' 'libgee'
         'gnome-video-effects' 'hicolor-icon-theme' 'dconf' 'cogl')
makedepends=('pkgconfig' 'gnome-doc-utils' 'intltool' 'gobject-introspection' 'itstool'
             'nautilus-sendto')
optdepends=('nautilus-sendto: Send images')
groups=('gnome-extra')
options=('!libtool' '!emptydirs')
url="http://www.gnome.org/projects/cheese/"
install=cheese.install
source=(http://ftp.gnome.org/pub/gnome/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('93fdeabd969a07aabc39c4aa91bc25a67f6e8b7e95c4801cccdb36af356385da')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --disable-schemas-compile
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
