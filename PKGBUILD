# Maintainer: korimitsu <korimitsu_aur.wackiness926@passinbox.com>
# Based on ocaml4-findlib PKGBUILD by:
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Thomas S Hatch <thatch45@gmail.com>
# Contributor: Sebastian Wiesner <lunaryorn@googlemail.com>
# Contributor: Benjamin Andresen <benny@klapmuetz.org>
# Contributor: scj <scj@archlinux.us>
# Contributor: Alif <alive4ever@live.com>

# Adds AARCH64 and mirror for source tarball
pkgname=ocaml4-findlib-noframepointers
pkgver=1.9.6
pkgrel=7
pkgdesc='OCaml package manager'
arch=(x86_64 aarch64)
url='http://projects.camlcity.org/projects/findlib.html'
license=(MIT)
depends=(ocaml4-compiler-libs-noframepointers ocaml4-noframepointers)
provides=("ocaml4-findlib=${pkgver}")
conflicts=("ocaml4-findlib" "ocaml-findlib")
options=(!makeflags !strip staticlibs zipman)
# HTTP 504 most of the time
#source=("http://download.camlcity.org/download/findlib-$pkgver.tar.gz")
source=("findlib-${pkgver}.tar.gz::https://gentoo.osuosl.org/distfiles/28/findlib-${pkgver}.tar.gz")
b2sums=('c9c98b9e92c0cf690e2c8794a1ed606c0288d49a016dfa08592c9f617be1020385f52bf37345a7cbcbc7f0fcb19750a6617036cbf90afef231eccdbc7132baf8')

build() {
  cd findlib-$pkgver
  ./configure \
    -config /etc/findlib.conf \
    -mandir /usr/share/man \
    -sitelib /usr/lib/ocaml
  make all opt
}

package () {
  cd findlib-$pkgver
  make prefix="$pkgdir" install
  install -Dm755 src/findlib/ocamlfind_opt "$pkgdir/usr/bin/ocamlfind_opt"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
