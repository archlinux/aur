# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Henrique C. Alves <hcarvalhoalves@gmail.com>

pkgname=matchbox-panel
pkgver=2.11
pkgrel=1
pkgdesc="A flexible always present 'window bar' for holding application launchers and small 'applet' style applications"
arch=('x86_64')
license=('GPL')
depends=('libmatchbox' 'startup-notification' 'libpng' 'gtk3' 'dbus-glib')
url="http://matchbox-project.org/"
source=("http://git.yoctoproject.org/cgit/cgit.cgi/matchbox-panel-2/snapshot/matchbox-panel-2-$pkgver.tar.bz2")
sha256sums=('f357ea9bb95b4219a09fe77fcb344f4618e588bc082dadfe3f72e051a7411917')

prepare() {
  cd "$srcdir"/$pkgname-2-$pkgver
  find -type f -name 'Makefile*' -exec sed -i 's|-Werror||g' {} \;
  sed -i 's|sync |xsync |g' applets/showdesktop/showdesktop.c
}

build() {
  cd "$srcdir"/$pkgname-2-$pkgver
  ./autogen.sh
  ./configure --sysconfdir=/etc --prefix=/usr \
    --enable-startup-notification
  make
}

package() {
  cd "$srcdir"/$pkgname-2-$pkgver
  make DESTDIR="$pkgdir" install
}
