# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname=opam2
pkgver=2.0.0_rc
pkgrel=1
pkgdesc="OCaml package manager"
arch=('i686' 'x86_64')
url="https://opam.ocaml.org/"
license=('GPL')
depends=('ocaml' 'unzip' 'curl')
optdepends=('darcs: For downloading packages with darcs'
            'git: For downloading packages with git'
            'mercurial: For downloading packages with mercurial'
            'rsync: For downloading packages with rsync')
makedepends=('ocaml-compiler-libs')
provides=('opam')
conflicts=('opam')
source=("https://github.com/ocaml/opam/releases/download/${pkgver//_/-}/opam-full-${pkgver//_/-}.tar.gz")
sha256sums=('1196b5a1aee66aa87eb01c005733992612718b6ee157b777340878f0e0434af6')

build() {
  cd "opam-full-${pkgver//_/-}"

  ./configure --prefix=/usr
  make -j1 lib-ext all
}

package() {
  make -C "opam-full-${pkgver//_/-}" DESTDIR="$pkgdir" install
}
