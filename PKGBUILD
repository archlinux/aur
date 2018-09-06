# $Id$
# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>

pkgname=signal-web-gateway-git
pkgver=0.1
pkgrel=1
pkgdesc="Use Signal as a web gateway for other apps (reporting, monitoring, etc.)"
arch=('x86_64')
url="https://gitlab.com/morph027/signal-web-gateway"
license=('MIT')
makedepends=('go')
_gourl=github.com/morph027/textsecure

build() {
  GOPATH="$srcdir" go get -v ${_gourl}/... # -fix -x
}

package() {
  install -Dm755 "$srcdir/bin/azure-storage-azcopy" "$pkgdir/usr/bin/azcopy"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}
