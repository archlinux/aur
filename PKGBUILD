# Maintainer: Gustavo Castro < gustawho [at] gmail [dot] com >
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: boromil@gmail.com

pkgname=raw-thumbnailer
pkgver=47.0.1
pkgrel=3
pkgdesc="A lightweight and fast raw image thumbnailer that can be used by file managers."
url="https://gitlab.gnome.org/World/gnome-raw-thumbnailer/"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('libopenraw')
makedepends=('meson' 'python' 'ninja' 'cargo' 'git')
conflicts=('raw-thumbnailer-entry')
source=("$url/-/archive/$pkgver/gnome-$pkgname-$pkgver.tar.gz")
sha256sums=('56b76fa25febf8a5795a63a8c6c85428d2c326924adfebd63192e2b208f1b4fc')

prepare() {
  meson subprojects download --sourcedir=gnome-$pkgname-$pkgver
}

build() {
  arch-meson gnome-$pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
