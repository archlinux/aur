# Maintainer: Jan Keith Darunday <jkcdarunday@gmail.com>

pkgname=ahoviewer-git
_pkgname=ahoviewer
pkgver=1.6.5.233.gce4f2ab
pkgrel=1
pkgdesc='A GTK2 image viewer, manga reader, and booru browser.'
arch=('i686' 'x86_64')
url='http://github.com/ahodesuka/ahoviewer'
license=('MIT')
depends=('gtkmm3>=3.22.0' 'libconfig>=1.4')
optdepends=('gstreamer' 'gst-plugins-base' 'gst-plugins-bad' 'gst-plugins-good' 'gst-libav' 'libpeas>=1.22.0' 'libsecret' 'libunrar' 'libzip' )
makedepends=('meson')
provides=('ahoviewer')
source=('git+https://github.com/ahodesuka/ahoviewer')
md5sums=('SKIP')

prepare() {
    cd $srcdir/ahoviewer
    sh version.sh
}

pkgver() {
  cd $_pkgname
  git describe | sed 's/-/./g'
}

build() {
  arch-meson --auto-features=auto $_pkgname build
  meson compile -C build
}


check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -Dm644 $srcdir/ahoviewer/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim: ft=sh syn=sh et
