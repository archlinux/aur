# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Maato <maato softwarebakery com>
pkgname=volumeicon-gtk2
_pkgname=volumeicon
pkgver=0.5.1
pkgrel=4
pkgdesc='Volume control for the system tray (gtk2)'
arch=(x86_64 i686)
url='https://softwarebakery.com/maato/volumeicon.html'
license=(GPL3)
depends=(alsa-lib gtk2 libnotify)
makedepends=(git intltool)
install=volumeicon.install
source=("http://softwarebakery.com/maato/files/volumeicon/$_pkgname-$pkgver.tar.gz"
        gtk2.patch
        volumeicon.desktop)
sha256sums=('24b8c1d0a81d708b201ce6e67301fc175d65588d892d01859f667b8db8a05da0'
            '7980d0eadfeea474b51d4e43aecde9c28c5c91729b8601acf9472300fb1bdc2a'
            '3f989bce3a080b2446af6d7ed7e8a22dfd3019f888a7b11a0759bf7cf704f975')

provides=($_pkgname=$pkgver-$pkgrel)
conflicts=($_pkgname)

prepare() {
  cd $_pkgname-$pkgver

  patch -Np2 -b -z .orig -i ../gtk2.patch
  autoreconf -fi
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --enable-notify
  make
}

package() {
  make -C $_pkgname-$pkgver DESTDIR="$pkgdir" install
  install -Dm644 volumeicon.desktop "$pkgdir/usr/share/applications/volumeicon.desktop"
  rm -f "$pkgdir/usr/share/volumeicon/gui/*.orig"
}

# vim: ts=2 sw=2 et:
