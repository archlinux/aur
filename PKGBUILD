# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=alire
pkgver=1.1.0
pkgrel=1
pkgdesc="A catalog of ready-to-use Ada libraries plus a command-line tool (alr) to obtain, build, and incorporate them into your own projects. It aims to fulfill a similar role to Rust's cargo or OCaml's opam."
arch=('i686' 'x86_64')
url="https://alire.ada.dev/"
license=(GPL3)
depends=(gnatcoll-core)
makedepends=(git gprbuild)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alire-project/alire/archive/refs/tags/v$pkgver.tar.gz"
alire.patch
git+https://github.com/alire-project/xmlezout.git#commit=1fcbd0b9303d044d8f09a8ef652afa8c0400ee8b
git+https://github.com/mosteo/ajunitgen.git#commit=e5d01db5e7834d15c4066f0a8e33d780deae3cc9
git+https://github.com/mosteo/aaa.git#commit=12201a008c07e6ef0e4f21d327c941bed97d7166
git+https://github.com/alire-project/semantic_versioning.git#commit=fe4e72e40786589a66d53662639f894fcdb3419c
git+https://github.com/alire-project/simple_logging.git#commit=02a7de7568af6af7cedd1048901fae8e9477b1d9
git+https://github.com/pmderodat/ada-toml.git#commit=ff7a848dff4c061e5fc6199665effb76a0e09f68
git+https://github.com/alire-project/gnatcoll-core.git#commit=e250e4e42d9743b782788cf61b4ddc10a45e69e2
git+https://github.com/mosteo/ansi-ada#commit=acf9afca3afe1f8b8843c061f3cef860d7567307
git+https://github.com/mosteo/uri-ada.git#commit=b61eba59099b3ab39e59e228fe4529927f9e849e
git+https://github.com/mosteo/minirest#commit=4550aa356d55b9cd55f26acd34701f646021c5ff
git+https://github.com/Fabien-Chouteau/spdx_ada#commit=2df9b1182544359c751544e52e14c94830d99fa6
git+https://github.com/HeisenbugLtd/si_units#commit=39de6478ba6d63c24dd34dd7205a6ce2cb971703
git+https://github.com/alire-project/clic#commit=32a93777a3e1796534e07c59966075a3d6f4f503
git+https://github.com/mosteo/optional#commit=0c7d20c0c8b48ccb6b25fb648d48382e598c25c3
git+https://github.com/mosteo/stopwatch#commit=b43f3e6e6fdc8ed5d36c30d1ce57738989a45977
git+https://github.com/mosteo/toml_slicer#commit=1c0286bd724c6f257a36fc89412fcefd4f555228
)
b2sums=('564111730c38f63078806fec455b392053b4d890e82ddb8fc9906947c01e0d5d0e5539b201016453f312082ac36dd84dfaae59c49738b8e601a87ae6aab92a55'
        'ed26931226df0009965e75aedf726f6ccd76766b4108ebf99895e1afff28d35122a4bee953d43713564ffaea67fb28bcea381602fcc457e84de94326710a613f'
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

