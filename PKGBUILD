# Maintainer: PhotonX <photon89 [at] gmail.com>

pkgname=icsp-git
_pkgname=icsp
pkgver=r27.d65ab58
pkgrel=1
pkgdesc="Command-line iCalendar (.ics) parser that converts to TSV/CSV"
arch=('any')
url="https://github.com/loteoo/icsp"
license=('MIT')
depends=()
makedepends=('git')
source=('icsp::git+https://github.com/loteoo/icsp.git')
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's|$(dirname "$(readlink -f "$0")")|/usr/share/icsp|' ./icsp
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -m755 "./icsp" "$pkgdir/usr/bin/icsp"
  install -D -m755 "./csv-to-ics.awk" "$pkgdir/usr/share/icsp/csv-to-ics.awk"
  install -D -m755 "./ics-to-csv.awk" "$pkgdir/usr/share/icsp/ics-to-csv.awk"
}

