# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92+57+g390364d
pkgrel=1
pkgdesc="PGP encryption and signing for nautilus"
arch=(x86_64)
url="https://gitlab.gnome.org/GNOME/seahorse-nautilus.git/"
license=(GPL)
depends=(libcryptui nautilus libgnome-keyring)
makedepends=(meson git)
_commit=390364db3bb09d7f6e07e3de90c872112584442a  # master
source=("git+https://gitlab.gnome.org/GNOME/seahorse-nautilus.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
