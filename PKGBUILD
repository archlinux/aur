# Maintainer: Ralph Plawetzki <ralph@purejava.org>

pkgname=seahorse-nautilus-ext
pkgver=3.11.92+57+g390364d
pkgrel=1
pkgdesc="PGP encryption and signing for nautilus"
arch=(x86_64)
url="https://gitlab.gnome.org/purejava/seahorse-nautilus/tree/encrypt-ext-conf"
license=(GPL)
depends=(libcryptui nautilus libgnome-keyring)
makedepends=(meson git)
provides=(seahorse-nautilus)
conflicts=(seahorse-nautilus)
_commit=390364db3bb09d7f6e07e3de90c872112584442a  # master
source=($pkgname::"git+https://gitlab.gnome.org/GNOME/seahorse-nautilus.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
	git apply ../../0001-Make-file-extension-for-encrypted-files-configurable.patch
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
