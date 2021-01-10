# Maintainer: milk <aur at milkmiruku dot com>
_pkgname="petri-foo"
pkgname="${_pkgname}-git"
pkgver=r226.5e73217
pkgrel=1
pkgdesc="A fork of specimen, a MIDI controllable audio sampler, for JACK. sollapse fork."
arch=('i686' 'x86_64')
url="https://github.com/sollapse/Petri-Foo"
license=('GPL2')
depends=('jack' 'libgnomecanvas')
makedepends=('cmake')
optdepends=('liblo: Non Session Manager support')
provides=('petri-foo')
conflicts=('petri-foo')
source=('petri-foo::git+https://github.com/mxmilkiib/Petri-Foo')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DUpdateMime:BOOL=OFF .
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
