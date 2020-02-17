pkgname=vte3-ng
_basever=0.58.2
pkgver=$_basever.a
pkgrel=1
pkgdesc="Enhanced Virtual Terminal Emulator widget for use with GTK3 (patched with support for fullwidth emoji)"
arch=('x86_64')
license=('LGPL')
options=('!emptydirs')
depends=('gtk3' 'vte-common' 'pcre2')
makedepends=('intltool' 'gobject-introspection' 'gtk3' 'vala' 'gtk-doc' 'gperf' 'meson')
url="https://github.com/thestinger/vte-ng"
source=($pkgname-$pkgver.tar.gz::https://github.com/thestinger/vte-ng/archive/$pkgver.tar.gz)
sha256sums=('2aecf7dc4e15789f93be38eec63c8bed22ea3adb431b37e7117bb8bd9a4f28a9')
provides=(vte3=$_basever vte3-ng)
conflicts=(vte3)

build() {
  arch-meson "vte-ng-$pkgver" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  rm "$pkgdir/etc/profile.d/vte.sh"
}
