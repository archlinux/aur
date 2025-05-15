# Maintainer: Gustavo Castro < gustawho [at] gmail [dot] com >
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: boromil@gmail.com

pkgname=raw-thumbnailer
pkgver=48.0.0
pkgrel=1
pkgdesc="A lightweight and fast raw image thumbnailer that can be used by file managers."
url="https://gitlab.gnome.org/World/gnome-raw-thumbnailer/"
license=('GPL-2.0-or-later')
arch=('x86_64')
depends=('libopenraw')
makedepends=('meson' 'python' 'ninja' 'cargo' 'git')
conflicts=('raw-thumbnailer-entry')
source=("$url/-/archive/$pkgver/gnome-$pkgname-$pkgver.tar.gz")
sha256sums=('94726a4e546da866b3f3f1cfd79b25988699a4e11a00bba471915a31d96b95fd')

prepare() {
  meson subprojects download --sourcedir=gnome-$pkgname-$pkgver
}

build() {
  arch-meson gnome-$pkgname-$pkgver build -Dprofile=release
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
