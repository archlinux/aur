# Maintainer:
# Contributor: Clayton Craft <clayton@craftyguy.net>

_pkgname="terminate"
pkgname="$_pkgname"
pkgver=0.5
pkgrel=2
pkgdesc="Minimal terminal emulator based on VTE"
url="https://git.sr.ht/~craftyguy/terminate"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'vte3'
)
makedepends=(
  'meson'
  'scdoc'
)

backup=("etc/terminate/config")

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/$pkgver.$_pkgext")
sha256sums=('e97a9cc4ee38b04fc178275154f46d6071f3f1dad081185c21503d4ef59d7aa8')

build() {
  arch-meson "$_pkgsrc" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "$_pkgsrc/config" -t "$pkgdir/etc/$pkgname"
}
