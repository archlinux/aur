# Maintainer: Edgar Vincent <e-v@posteo.net>
_pkgname=caerbannog
pkgname=${_pkgname}-git
pkgver=0.1.r7.gbc3e4f4
pkgrel=1
pkgdesc="A GUI frontend for pass, particularly suited for mobile use"
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~craftyguy/caerbannog"
license=('GPL3')
depends=('pass' 'python-gpgme' 'python-gobject')
makedepends=('meson')
provides=()
replaces=()
source=('git+https://git.sr.ht/~craftyguy/caerbannog')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # cd "$srcdir/$_pkgname"
  arch-meson $_pkgname build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}

# vim:set ts=2 sw=2 et:
