# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=alire
pkgver=1.0.1
pkgrel=1
pkgdesc="A catalog of ready-to-use Ada libraries plus a command-line tool (alr) to obtain, build, and incorporate them into your own projects. It aims to fulfill a similar role to Rust's cargo or OCaml's opam."
arch=('i686' 'x86_64')
url="https://alire.ada.dev/"
license=(GPL3)
depends=(gnatcoll-core)
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
b2sums=('ce32bac22c414f3ef07bf1455d2e4686a09cbf7dc7a738647ad2cf47aaca59f91577a9a125402b5de4059f633a31d8dbde07ce91d5c1b5a577687ec9591f06e9'
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
  patch --strip=1 < "$srcdir/alire.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gprbuild -j0 -P alr_env -cargs -gnatws
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  gprinstall -P alr_env -p --prefix="$pkgdir/usr"
}

# vim:set ts=2 sw=2 et:

