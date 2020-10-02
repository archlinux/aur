# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>

_pkgname=dbus
pkgname="golang-github-godbus-${_pkgname}"

pkgver=5.0.3
pkgrel=2
pkgdesc="Native Go bindings for D-Bus"
arch=('x86_64' 'i686')
url="https://github.com/godbus/dbus"
license=('BSD')
depends=('go')
options=('!strip' '!emptydirs')
source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://github.com/godbus/${_pkgname}/archive/v$pkgver.tar.gz")
sha256sums=('49d27bde2861f5e5ab4195fddc5f38f25324aac3b32b3cc03e712cca3d2b75fa')
replaces=('dbus-go')
conflicts=('dbus-go')

heck() {
  cd "${_pkgname}-${pkgver}"
  go test -v ./...
}

package() {
  mkdir -p "$pkgdir/usr/share/gocode/src/github.com/godbus/"
  cp -a --preserve=timestamps "${_pkgname}-${pkgver}" "$pkgdir/usr/share/gocode/src/github.com/godbus/dbus"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "${_pkgname}-${pkgver}/$f" ]; then
      install -Dm644 "${_pkgname}-${pkgver}/$f" "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
