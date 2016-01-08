# Maintainer: Gimmeapill <gimmeapill at gmail dot com>
# Maintainer: Daniel Appelt <daniel.appelt@gmail.com>

_pkgbasename=sequencer64
pkgname=${_pkgbasename}-git
pkgver=r1.b23e622
pkgrel=1
pkgdesc="Minimal loop based midi sequencer. A more object-oriented successor to Sequencer24/Seq24, with many additional features, and more planned."
arch=('i686' 'x86_64')
url="https://github.com/ahlstromcj/sequencer64"
license=('GPL')
depends=('gtkmm' 'jack')
makedepends=('git' 'doxygen' 'texlive-bin')
provides=("${_pkgbasename}")
conflicts=("${_pkgbasename}")

source=("${_pkgbasename}::git://github.com/ahlstromcj/sequencer64.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgbasename}"
    ./bootstrap
    ./configure --prefix=/usr --disable-lash
    make
}

package() {
    cd "${srcdir}/${_pkgbasename}"
    make DESTDIR="${pkgdir}" install
}

