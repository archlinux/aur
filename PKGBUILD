# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Pablo Lezaeta <prflr88@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>

pkgname=libxfcegui4
pkgver=4.10.0
pkgrel=6
pkgdesc="Various Gtk widgets for Xfce4 (Deprecated library)"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
depends=('startup-notification' 'xfconf' 'libglade' 'libsm' 'hicolor-icon-theme')
makedepends=('intltool')
source=("https://archive.xfce.org/src/archive/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2"
        'libxfcegui4-4.10.0-no-xfce_setenv.patch')
sha256sums=('2b82f9979175d8856880c8f349e6eede491ca92fe6940c69c8958115418d4533'
            'd1f4603b5eeef92d5d256d8f766e516395947d72e16db68ce47e472130b94616')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # https://bugzilla.xfce.org/show_bug.cgi?id=10974
  patch -Np0 -i "$srcdir/libxfcegui4-4.10.0-no-xfce_setenv.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
