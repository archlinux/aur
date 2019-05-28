# Maintainer: Philipp Wolfer <ph.wolfer@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: György Balló <ballogy@freestart.hu>

pkgname=gssdp-1.0
pkgver=1.0.3
pkgrel=4
pkgdesc="A GObject-based API for handling resource discovery and announcement over SSDP"
url="https://wiki.gnome.org/Projects/GUPnP"
arch=(x86_64)
license=(LGPL)
depends=(libsoup)
makedepends=(gobject-introspection gtk-doc vala meson git gtk3)
optdepends=('gtk3: gssdp-device-sniffer')
_commit=386a53714a650cd10b40019b818864add93e9d0f  # tags/gssdp-1.0.3^0
source=("git+https://gitlab.gnome.org/GNOME/gssdp.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd gssdp
  git describe --tags | sed 's/^gssdp-//;s/-/+/g'
}

prepare() {
  cd gssdp
}

build() {
  arch-meson gssdp build -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  mv "$pkgdir"/usr/bin/gssdp-device-sniffer "$pkgdir"/usr/bin/gssdp-device-sniffer-1.0
  mv "$pkgdir"/usr/share/gtk-doc/html/gssdp "$pkgdir"/usr/share/gtk-doc/html/gssdp-1.0
}
