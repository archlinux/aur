# Maintainer: Victor Ferreira <dev.victorferreira@gmail.com>

pkgname=spider-git
pkgrel=1
pkgver=v0.0.8
pkgdesc="Install and integrate web apps into the GNOME desktop"
arch=('x86_64')
url="https://github.com/Zaedus/spider"
license=('MIT')

depends=('gtk4' 'libadwaita' 'webkitgtk-6.0' 'curl')
makedepends=('git' 'meson' 'rust' 'pkgconf' 'python-gobject')

provides=("spider")
conflicts=('spider')

source=("$pkgname::git+$url.git#branch=development")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  meson setup build --prefix=/usr --buildtype=release
}

package() {
  cd "$pkgname"
  meson install -C build --destdir "$pkgdir"
}
