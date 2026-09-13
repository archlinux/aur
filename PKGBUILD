# Maintainer: cosct <cosct@outlook.com>
# EgisTec EH575 (1c7a:0575) experimental driver on current libfprint.
# Research project: https://github.com/cosct/fprintdriver
#
# Canonical copy of the AUR package; release CI syncs it to
# ssh://aur@aur.archlinux.org/libfprint-egis0575.git on every
# egis0575-v* tag (pkgver + sha256sums updated automatically).
pkgname=libfprint-egis0575
pkgver=0.2.0
pkgrel=1
pkgdesc="libfprint with the experimental EgisTec EH575 (1c7a:0575) fingerprint driver (press-snapshot + Windows-engine matcher port)"
arch=(x86_64)
url="https://github.com/cosct/libfprint-egis0575"
license=(LGPL-2.1-or-later)
options=(!debug)
# vendored libfprint builds all drivers by default: uru4000 needs openssl
# at build time and links libssl/libcrypto at runtime; nothing needs nss.
depends=(libusb libgusb openssl pixman glib2 libgudev)
makedepends=(meson ninja gobject-introspection gtk-doc)
# 1.94.100 = bundled libfprint base; soversion 2 -> libfprint-2.so=2-64
provides=(libfprint=1.94.100 libfprint-2.so=2-64)
conflicts=(libfprint libfprint-egis-0575 libfprint-egis0575-experimental)
replaces=(libfprint-egis-0575)
source=("$pkgname-$pkgver.tar.gz::https://github.com/cosct/libfprint-egis0575/archive/refs/tags/egis0575-v$pkgver.tar.gz")
sha256sums=('806c0f11bf883532f506c773eb7afabc5e4e1eeffbe2b6808fc4dff4d9933505')

build() {
  arch-meson "$pkgname-egis0575-v$pkgver" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
