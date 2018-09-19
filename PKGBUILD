# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=opam2
pkgver=2.0.0
pkgrel=1
pkgdesc="OCaml package manager"
arch=('x86_64')
url="https://opam.ocaml.org/"
license=('GPL')
depends=('ocaml' 'unzip' 'curl' 'bubblewrap')
optdepends=('darcs: For downloading packages with darcs'
            'git: For downloading packages with git'
            'mercurial: For downloading packages with mercurial'
            'rsync: For downloading packages with rsync')
makedepends=('ocaml-compiler-libs')
provides=('opam')
conflicts=('opam')
source=("https://github.com/ocaml/opam/releases/download/$pkgver/opam-full-$pkgver.tar.gz")
install=$pkgname.install
sha256sums=('9dad4fcb4f53878c9daa6285d8456ccc671e21bfa71544d1f926fb8a63bfed25')

build() {
  cd "opam-full-$pkgver"

  ./configure --prefix=/usr
  make -j1 lib-ext all
}

package() {
  make -C "opam-full-$pkgver" DESTDIR="$pkgdir" install
}
