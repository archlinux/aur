# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=alire
pkgver=2.0.0
pkgrel=2
pkgdesc="A catalog of ready-to-use Ada libraries plus a command-line tool (alr) to obtain, build, and incorporate them into your own projects. It aims to fulfill a similar role to Rust's cargo or OCaml's opam."
arch=('i686' 'x86_64')
url="https://alire.ada.dev/"
license=(GPL3)
depends=(unzip)
makedepends=(git gprbuild)
checkdepends=(python-e3-testsuite python-pexpect)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alire-project/alire/archive/refs/tags/v$pkgver.tar.gz"
alire.patch
git+https://github.com/alire-project/xmlezout.git#commit=1fcbd0b9303d044d8f09a8ef652afa8c0400ee8b
git+https://github.com/mosteo/ajunitgen.git#commit=e5d01db5e7834d15c4066f0a8e33d780deae3cc9
git+https://github.com/mosteo/aaa.git#commit=dff61d2615cc6332fa6205267bae19b4d044b9da
git+https://github.com/alire-project/semantic_versioning.git#commit=cc2148cf9c8934fb557b5ae49a3f7947194fa7ee
git+https://github.com/alire-project/simple_logging.git#commit=3505dc645f3eef6799a486aae223d37e88cfc4d5
git+https://github.com/pmderodat/ada-toml.git#commit=da4e59c382ceb0de6733d571ecbab7ea4919b33d
git+https://github.com/alire-project/gnatcoll-core.git#commit=4e663b87a028252e7e074f054f8f453661397166
git+https://github.com/mosteo/ansi-ada#commit=dc770a5a6cdaad8668c32b0cd4625a7d648f8ca2
git+https://github.com/mosteo/uri-ada.git#commit=02a0780d7757e9e79b3410c3a34960655cacea3d
git+https://github.com/mosteo/minirest#commit=9a9c660f9c6f27f5ef75417e7fac7061dff14d78
git+https://github.com/Fabien-Chouteau/spdx_ada#commit=2df9b1182544359c751544e52e14c94830d99fa6
git+https://github.com/alire-project/clic#commit=56bbdc008e16996b6f76e443fd0165a240de1b13
git+https://github.com/mosteo/optional#commit=0c7d20c0c8b48ccb6b25fb648d48382e598c25c3
git+https://github.com/mosteo/stopwatch#commit=f607a63b714f09bbf6126de9851cbc21cf8666c9
git+https://github.com/mosteo/toml_slicer#branch=alire
git+https://github.com/mosteo/dirty_booleans#branch=alire
git+https://github.com/mosteo/diskflags#branch=alire
git+https://github.com/mosteo/si_units#branch=alire
# Transitive dependency of aaa
git+https://github.com/mosteo/umwi.git#commit=34abe38402431ced3e2f2018acecc6dfa1ab860e
)
b2sums=('1323435d5a3591cbbf9e27d017caf3c426fe9aa571f8a092784acf8b85f350c885fc07f32c9670b0e32250bac4490387e0f022a3312b3cd7c0c2831d9d5c1a2a'
        'f817589eaa80cddff6b41154c57955e1698af8562b56edce8fccac9924d3f61be67ef26b7253fa77cf1e99f51a265208240a7c0984ceb44662d4da9223efa2e4'
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
  patch --strip=1 < "$srcdir/alire.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  gprbuild -j0 -P alr_env -XALIRE_OS=linux
}

check() {
  cd "$srcdir/$pkgname-$pkgver/testsuite"
  ./run.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  gprinstall -P alr_env -p --prefix="$pkgdir/usr" -XALIRE_OS=linux
  install -D scripts/alr-completion.bash "$pkgdir/usr/share/bash-completion/completions/alr"
}

# vim:set ts=2 sw=2 et:

