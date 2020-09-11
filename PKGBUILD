# Maintainer: Jan Keith Darunday <jkcdarunday@gmail.com>

pkgname=ahoviewer-git
_pkgname=ahoviewer
pkgver=1.6.5.127.g518c20c
pkgrel=1
pkgdesc="A GTK2 image viewer, manga reader, and booru browser."
arch=('i686' 'x86_64')
url="http://github.com/ahodesuka/ahoviewer"
license=('MIT')
depends=('gtkmm3>=3.22.0' 'libconfig>=1.4')
optdepends=('gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'gst-libav' 'libpeas>=1.22.0' 'libsecret' 'libunrar' 'libzip' )
makedepends=('git' 'meson' 'ninja')
provides=('ahoviewer')
source=("git://github.com/ahodesuka/ahoviewer")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe | sed 's/-/./g'
}

prepare() {
  cd $srcdir/$_pkgname
  meson build --prefix=/usr -Dbuildtype=release
}

build() {
  cd $srcdir/$_pkgname/build
  ninja
}

package() {
  cd $srcdir/$_pkgname/build
  DESTDIR="$pkgdir" ninja install
  install -Dm644 $srcdir/ahoviewer/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh syn=sh et
