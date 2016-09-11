# vim: set ft=sh:
# Maintainer: Yen Chi Hsuan <yan12125 at gmail dot com>

_pkgname=version-control-tools
pkgname=$_pkgname-hg
pkgver=r4759.6c8605c9e78f
pkgrel=1
pkgdesc="Tools, extensions, hooks, etc to support version control at Mozilla"
url="https://mozilla-version-control-tools.readthedocs.io/en/latest/"
arch=('any')
depends=('mercurial')
provides=("$_pkgname")
license=('custom:MPL2')
source=("$_pkgname"::"hg+https://hg.mozilla.org/hgcustom/version-control-tools"
        MPL2.html::https://www.mozilla.org/en-US/MPL/2.0/)
sha512sums=('SKIP'
            '8da1d55827c0dfafd7685a487db81533f32d20df32223e6d659ac557351d8b4fda791077d2090c7b0a2e3c7e8ac82d0b21e30dfdc14d014de906fba38d35cc89')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

package() {
  cd "$srcdir/"

  install -Ddm755 "$pkgdir/opt/"
  cp -dr --no-preserve=ownership "$_pkgname" "$pkgdir/opt/"
  rm -rf "$pkgdir/opt/$_pkgname/.hg"*

  install -Ddm755 "$pkgdir/usr/share/licenses/version-control-tools-hg"
  install -Dm644 MPL2.html "$pkgdir/usr/share/licenses/version-control-tools-hg/MPL2.html"
}
