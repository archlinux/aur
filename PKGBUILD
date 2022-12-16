# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfce4-volumed-pulse
_vmaj=0.2
_vmin=3
pkgver=$_vmaj.$_vmin
pkgrel=3
pkgdesc='A volume keys control daemon for Xfce using pulseaudio'
arch=('i686' 'x86_64')
license=('GPL3')
conflicts=('xfce4-volumed')
replaces=('xfce4-volumed')
url="https://gitlab.xfce.org/apps/$pkgname"
depends=('libnotify' 'pulseaudio' 'libkeybinder3' 'xfconf')
makedepends=('git' 'xfce4-dev-tools')
optdepends=('xfce4-notifyd: for OSD notifications')
sha256sums=('4cc4ea464046a1e98705780c93e655d23c92f29122d91a593aea98155a2716fa')
source=("https://gitlab.xfce.org/apps/$pkgname/-/archive/$pkgname-$pkgver/$pkgname-$pkgname-$pkgver.tar.bz2")

build() {
  cd $pkgname-$pkgname-$pkgver
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc \
              --libexecdir=/usr/lib \
              --localstatedir=/var
  make
}

package() {
  cd $pkgname-$pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
