# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=wayfarer
pkgver=1.2.4
pkgrel=2
pkgdesc='Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer'
license=('GPL3')
makedepends=('git' 'vala' 'meson' 'gobject-introspection' 'blueprint-compiler')
depends=('gtk4' 'libpulse')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "vala-compact-class.patch::$url/commit/412aa1a667193917694598955101b5420e4ec77b.patch"
)
sha256sums=('3ce196192b0a7dd05771051c85e9aa78f2f36a21a0d905ebf9fd4b5cd6e11811'
            '9fe4a9bd3269eddf74214326a26385186d0992f1f8c5353822a2fa3b044ea419')

prepare() {
  cd ${pkgbase}-${pkgver}
  patch -p1 -i ${srcdir}/vala-compact-class.patch
}

build() {
  cd $pkgname-$pkgver
  meson setup build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  cd $pkgname-$pkgver
  DESTDIR="$pkgdir" meson install -C build
}
