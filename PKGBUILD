# Maintainer: Hugo Parente Lima <hugo.pl@gmail.com>

pkgname=tijolo-git
pkgver=HEAD
pkgrel=5
pkgdesc="Lightweight, keyboard-oriented IDE for the masses"
arch=("x86_64")
conflicts=("tijolo")
url="https://github.com/hugopl/tijolo"
license=("MIT")
depends=("gc" "libevent" "pcre" "gtksourceview4" "nerd-fonts-jetbrains-mono" "libgit2" "editorconfig-core-c" "ttf-font-awesome>=5.15")
makedepends=("git" "crystal>=1.0.0" "shards>=0.13.0")
source=("tijolo-git::git+https://github.com/hugopl/tijolo.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed s/-/+/g | sed s/v//
}

build() {
  cd "$srcdir/tijolo-git"
  make
}

check() {
  cd "$srcdir/tijolo-git"
  crystal spec
}

package() {
  cd "$srcdir/tijolo-git"
  make install DESTDIR="${pkgdir}"
}
