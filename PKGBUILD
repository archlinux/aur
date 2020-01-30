# Maintainer: Oliver Mangold <omgold@aur>

pkgname=mantid-term
pkgver=1.0.6
pkgrel=1
pkgdesc="Mantid is a xterm-compatible terminal emulator based on Vte-ng, similar to termite with customizable keybindings and multiple tabs"
url="https://github.com/omgold/mantid-term/"
license=('GPL2' 'GPL3')
arch=('x86_64')
depends=(gtk3 gnutls pcre2 python python-gobject gobject-introspection python-yaml)
optdepends=(python-prctl)
makedepends=(git libtool intltool gtk-doc scdoc pkg-config sed)
source=("git+https://github.com/omgold/mantid-term#commit=3900d2385ce754cf8fb79aaac58c906a4a82b191"
        "git+https://github.com/thestinger/vte-ng#commit=dd74ae7c06e8888af2fc090ac6f8920a9d8227fb")
sha256sums=(SKIP SKIP)

prepare() {
  cd mantid-term
  git submodule init
  git config --local submodule.vte-ng.url "$srcdir/vte-ng"
  git submodule update
}

build() {
  mkdir -p mantid-term/build
  cd mantid-term/build
  make -C .. vte-ng
  make -C ..
}

package() {
  cd mantid-term/build
  make -C .. install DESTDIR="$pkgdir"
}
