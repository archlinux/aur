# Maintainer:
# Contributor: Olaf Bauer <hydro@freenet.de>

_pkgname='dtv-scan-tables'
pkgname="$_pkgname-git"
pkgver=r1297.833d4cc1
pkgrel=1
pkgdesc="Digital TV scan tables"
arch=('any')
url="https://git.linuxtv.org/dtv-scan-tables.git"
license=('GPL2' 'LGPL2')

depends=()
makedepends=(
  'git'
  'v4l-utils'
)

provides=('dtv-scan-tables')
conflicts=('dtv-scan-tables')

source=(
  "$_pkgname"::"git+$url"
)
sha256sums=(
  'SKIP'
)

_pkgsrc="$_pkgname"
pkgver() {
  cd "$srcdir/$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgsrc"
  make dvbv3
}

package() {
  cd "$srcdir/$_pkgsrc"
  make PREFIX="$pkgdir/usr" DVBV5DIR=dvb install
  make PREFIX="$pkgdir/usr" install_v3
}
