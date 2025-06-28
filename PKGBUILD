# Maintainer:
# Contributor: Olaf Bauer <hydro@freenet.de>

: ${_commit=}

_pkgname='dtv-scan-tables'
pkgname="$_pkgname-git"
pkgver=r1309.caca23f
pkgrel=1
pkgdesc="Digital TV scan tables"
url="https://git.linuxtv.org/dtv-scan-tables.git"
license=('GPL-2.0-only' 'LGPL-2.0-only')
arch=('any')

makedepends=(
  'git'
  'v4l-utils'
)

provides=('dtv-scan-tables')
conflicts=('dtv-scan-tables')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url${_commit:+#commit=$_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgsrc"
  make dvbv3
}

package() {
  cd "$_pkgsrc"
  make PREFIX="$pkgdir/usr" DVBV5DIR=dvb install
  make PREFIX="$pkgdir/usr" install_v3
}
