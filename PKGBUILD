# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=alire
pkgver=1.0.0
pkgrel=3
pkgdesc="A catalog of ready-to-use Ada libraries plus a command-line tool (alr) to obtain, build, and incorporate them into your own projects. It aims to fulfill a similar role to Rust's cargo or OCaml's opam."
arch=('i686' 'x86_64')
url="https://alire.ada.dev/"
license=(GPL3)
depends=(glibc)
makedepends=(git gprbuild)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alire-project/alire/archive/refs/tags/v$pkgver.tar.gz"
alire.patch
git+https://github.com/alire-project/xmlezout.git
git+https://github.com/mosteo/ajunitgen.git
git+https://github.com/mosteo/aaa.git
git+https://github.com/alire-project/semantic_versioning.git
git+https://github.com/alire-project/simple_logging.git
git+https://github.com/pmderodat/ada-toml.git
git+https://github.com/alire-project/gnatcoll-core.git
git+https://github.com/alire-project/libhello.git
git+https://github.com/mosteo/ansi-ada
git+https://github.com/mosteo/uri-ada.git
git+https://github.com/mosteo/minirest
git+https://github.com/Fabien-Chouteau/spdx_ada)
b2sums=('bad08a570d464d454739edb42717a5ad33eb132dea4c3f2752e26bf122aa6a6b058e1b89987a9c8a6c5d432492b29586fbefad0e54207f8e7a9601ef1bbba9a0'
        '898ec902aab5e8d80b12c4b481224dfbc92a3acef049b0ca93db39b8303fefb172fb1e8d933f3dad936d4f3d7fa84c46c4119ad1f28d97cb2a11bf2f6c4681d3'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare()
{
  # Get the submodules from the sources above
  cd "$srcdir/$pkgname-$pkgver"
  git apply "$srcdir/alire.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gprbuild -j0 -P alr_env
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  gprinstall -P alr_env -p --prefix="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:

