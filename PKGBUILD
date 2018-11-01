# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=duplicacy-util
pkgver=1.5
pkgrel=1
pkgdesc="A utility to run Duplicacy backups"
arch=('x86_64' 'i686')
url="https://github.com/jeffaco/duplicacy-util"
license=('Apache License 2.0')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl=github.com/jeffaco/duplicacy-util

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
