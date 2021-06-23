# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=volumeicon-git
pkgver=0.5.1.r40.g27be3d4
pkgrel=1
pkgdesc='Volume control for the system tray'
arch=(x86_64)
url='https://softwarebakery.com/maato/volumeicon.html'
license=(GPL3)
depends=(alsa-lib gtk3 libnotify)
makedepends=(git intltool)
install=volumeicon.install
source=("git+https://github.com/Maato/volumeicon.git"
        volumeicon.desktop)
sha256sums=('SKIP'
            '3f989bce3a080b2446af6d7ed7e8a22dfd3019f888a7b11a0759bf7cf704f975')
conflicts=('volumeicon')
provides=('volumeicon')

pkgver() {
  cd volumeicon
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd volumeicon
  ./autogen.sh
}

build() {
  cd volumeicon
  ./configure --prefix=/usr --enable-notify
  make
}

package() {
  make -C volumeicon DESTDIR="$pkgdir" install
  install -Dm644 volumeicon.desktop "$pkgdir/usr/share/applications/volumeicon.desktop"
}
