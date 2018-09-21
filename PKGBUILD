# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=azcopy-10
pkgver=10.0.1
pkgrel=1
pkgdesc="A command-line utility designed for copying data to/from Microsoft Azure"
arch=('x86_64')
url="https://github.com/Azure/azure-storage-azcopy"
license=('MIT')
depends=('go')
conflicts=('azcopy')
_gourl=github.com/Azure/azure-storage-azcopy

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
