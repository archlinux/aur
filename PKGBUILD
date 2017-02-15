# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=pomodoro-applet
pkgver=1.0
pkgrel=1
pkgdesc="GNOME Panel applet for timing the intervals used in the Pomodoro Techinique(tm)"
arch=('i686' 'x86_64')
url="https://github.com/stump/pomodoro-applet"
license=('GPL')
depends=('gnome-panel')
makedepends=('intltool')
source=(http://ftp.stump.io/software/$pkgname/$pkgname-$pkgver.tar.gz
        0001-Port-to-libpanel-applet-5-and-gstreamer-1.0.patch
        0002-Switch-to-in-process-applet.patch)
sha256sums=('a3d3e4706177a12d403cdfd6aa7fa0f2f84597d2ecf74e5a85b6185e05ad74b2'
            '1af0a1f513758312466541d4c1d68abfd12b50b62bcd96b70ecfe16fbbdaad43'
            '73bc22035cae43bde160931ffa90750500688a0027d38f80e5851baad464714f')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -i ../0001-Port-to-libpanel-applet-5-and-gstreamer-1.0.patch
  patch -Np1 -i ../0002-Switch-to-in-process-applet.patch
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
