# Maintainer: Vladimir Tsanev <tsachev at gmail dot com>
# Slimbook QC71 EC platform driver, release 1.3.3 (generic_slimbook branch), DKMS.
_pkgbase=qc71_laptop
pkgname=qc71-laptop-slimbook-dkms
pkgver=1.3.3
pkgrel=1
pkgdesc="Slimbook QC71 EC platform driver (generic_slimbook branch, DKMS)"
arch=('x86_64')
url="https://github.com/Slimbook-Team/qc71_laptop"
license=('GPL-2.0-or-later')
depends=('dkms')
makedepends=('git')
provides=('qc71_laptop')
conflicts=('qc71-laptop-dkms-git' 'qc71-laptop-slimbook-dkms-git' 'qc71_laptop')
source=("$_pkgbase::git+$url.git#tag=$pkgver"
        'dkms.conf')
sha256sums=('SKIP'
            '5b96dbda6ade6dfa78b44ac9ddb80985683a3bb0960be3045ccd4603ab3dcf89')

package() {
  local dest="$pkgdir/usr/src/${_pkgbase}-${pkgver}"

  install -d "$dest"
  cp -r "$srcdir/$_pkgbase"/*.c "$srcdir/$_pkgbase"/*.h "$srcdir/$_pkgbase/Makefile" "$dest/"
  install -Dm644 "$srcdir/dkms.conf" "$dest/dkms.conf"
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "$dest/dkms.conf"

  install -Dm644 "$srcdir/$_pkgbase/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
