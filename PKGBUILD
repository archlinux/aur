# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=file-roller-git
pkgver=3.31.1.r18.g74305535
pkgrel=1
pkgdesc="Create and modify archives"
url="https://wiki.gnome.org/Apps/FileRoller"
arch=(x86_64)
license=(GPL)
depends=(gtk3 dconf libarchive file json-glib libnotify zip unzip)
makedepends=(yelp-tools git libnautilus-extension meson appstream-glib)
optdepends=('p7zip: 7z, arj, exe and encrypted zip files support'
            'unrar: better RAR archive support'
            'unace: ACE archive support'
            'lrzip: lrzip archive support')
conflicts=(file-roller)
provides=(file-roller)
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/file-roller.git")
sha256sums=('SKIP')

pkgver() {
  cd file-roller
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson file-roller build
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}