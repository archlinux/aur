# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports

_pkgname=talkatu
pkgname=$_pkgname-hg
pkgver=r191.11dfbe8b2012
pkgrel=1
pkgdesc="Gtk+ widgets for chat software"
arch=('i686' 'x86_64')
url="https://bitbucket.org/pidgin/talkatu"
license=('GPL2')
depends=('gtk3>=3.10.0' 'glade>=2.0' 'gumbo-parser>=0.10' 'gspell>=1.2' 'cmark')
makedepends=('mercurial' 'meson' 'help2man')
source=("$pkgname::hg+https://bitbucket.org/pidgin/$_pkgname")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" \
    "$(hg identify -n)" \
    "$(hg identify -i)"
}

build() {
  cd "${pkgname}"
  arch-meson build -Dtests=false
  ninja -C build
}

package() {
  cd "${pkgname}"
  DESTDIR="${pkgdir}" ninja -C build install
}
