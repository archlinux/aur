# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=seahorse-nautilus
pkgver=3.11.92+r96+g0fd324c
pkgrel=1
epoch=1
pkgdesc="PGP encryption and signing for nautilus"
url="https://gitlab.gnome.org/GNOME/seahorse-nautilus"
arch=(x86_64)
license=(GPL)
depends=(libnautilus-extension gtk3 gcr libcryptui libnotify)
makedepends=(meson git)
_commit=0fd324c191565bff76ca45a01b2da14b4ab7b3bd  # master
source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd $pkgname
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  depends+=(libnautilus-extension.so)

  meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
