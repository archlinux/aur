# Maintainer: Tim Lagnese <tim at inept tech>

pkgname=alire
pkgver=1.2.2
pkgrel=1
pkgdesc="A catalog of ready-to-use Ada libraries plus a command-line tool (alr) to obtain, build, and incorporate them into your own projects. It aims to fulfill a similar role to Rust's cargo or OCaml's opam."
arch=('i686' 'x86_64')
url="https://alire.ada.dev/"
license=(GPL3)
depends=(gnatcoll-core unzip)
makedepends=(git gprbuild)
source=("$pkgname-$pkgver.tar.gz::https://github.com/alire-project/alire/archive/refs/tags/v$pkgver.tar.gz"
alire.patch
git+https://github.com/alire-project/xmlezout.git#commit=1fcbd0b9303d044d8f09a8ef652afa8c0400ee8b
git+https://github.com/mosteo/ajunitgen.git#commit=e5d01db5e7834d15c4066f0a8e33d780deae3cc9
git+https://github.com/mosteo/aaa.git#commit=906d9eaf4fb8efabfbc3d8cfb34d04ceec340e13
git+https://github.com/alire-project/semantic_versioning.git#commit=fe4e72e40786589a66d53662639f894fcdb3419c
git+https://github.com/alire-project/simple_logging.git#commit=02a7de7568af6af7cedd1048901fae8e9477b1d9
git+https://github.com/pmderodat/ada-toml.git#commit=2a671ffb1039a036f2bb68bdc88afc8d3dc68c10
git+https://github.com/alire-project/gnatcoll-core.git#commit=92bb91130a9ec628b4c48b7ef9fe7f24d9dc25fa
git+https://github.com/mosteo/ansi-ada#commit=acf9afca3afe1f8b8843c061f3cef860d7567307
git+https://github.com/mosteo/uri-ada.git#commit=b61eba59099b3ab39e59e228fe4529927f9e849e
git+https://github.com/mosteo/minirest#commit=4550aa356d55b9cd55f26acd34701f646021c5ff
git+https://github.com/Fabien-Chouteau/spdx_ada#commit=2df9b1182544359c751544e52e14c94830d99fa6
git+https://github.com/HeisenbugLtd/si_units#commit=39de6478ba6d63c24dd34dd7205a6ce2cb971703
git+https://github.com/alire-project/clic#commit=185519d65b089c3238e24cfe87f1d22db1f3e0d9
git+https://github.com/mosteo/optional#commit=0c7d20c0c8b48ccb6b25fb648d48382e598c25c3
git+https://github.com/mosteo/stopwatch#commit=86e7302d29f360f98f568b6015755229949b2194
git+https://github.com/mosteo/toml_slicer#commit=8b9dff0f450394b07ea71f0eb9b39d9c20e21f9c
)
b2sums=('fc70ab6ba89dbe9d949700ad57dd9dce2f215c92731010a1bd255ef63e1beaddae852183a9cf2018eb2b054c69504d7785441356ab4299b1d0043896265ee8a7'
        '15799818a362547fa67bc9e614a3ff5b4645e268f48a8a2fe451592410be3d1fae0ff0cc96853e22813e6aa5a2a9a434f8585e26cb4bb1d5b75263177b7b81a6'
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
  gprbuild -j0 -P alr_env
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver/testsuite"
#  PATH="$srcdir/$pkgname-$pkgver/bin:$PATH" GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null ./run.py
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  gprinstall -P alr_env -p --prefix="$pkgdir/usr"
  install -D scripts/alr-completion.bash "$pkgdir/usr/share/bash-completion/completions/alr"
}

# vim:set ts=2 sw=2 et:

