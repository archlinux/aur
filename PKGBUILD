# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=buoh
pkgver=0.8.2
pkgrel=15
pkgdesc='Online strips comics reader for GNOME'
arch=('x86_64')
url='http://buoh.steve-o.org/'
license=('GPL')
depends=('gtk3' 'libsoup')
makedepends=('git' 'meson')
_commit=f4bd061683b5dfccd31748dff43b3710185628c8  # master
source=("git+https://gitlab.gnome.org/GNOME/buoh.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  git cherry-pick -n 39d069ec0bd23e89afab7a69183149bb433ee7bd # Fix build with meson 0.61
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
