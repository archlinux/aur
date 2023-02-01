# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=gcsvedit
pkgname=${_pkgname}-git
epoch=2
_pkgver=0.8.0
pkgver=0.8.0+58+c1c7746
pkgrel=1
pkgdesc='Simple text editor for CSV, TSV and other kinds of delimiter-separated values (DSV) files.'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/goetzc/gCSVedit"
license=('GPL3')
depends=('gtk3' 'libxml2' 'libtepl-6.so' 'gtksourceview4')
makedepends=('git')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  _rel_commit='0ca2625594c094ed4b8dd98a11e3c7a0a9747318'
  printf "%s+%s+%s" "${_pkgver}" "$(( `git rev-list --count HEAD` - `git rev-list --count ${_rel_commit}` ))" "$( git rev-parse --short HEAD )"
}

build() {
    cd "${_pkgname}"
    ./autogen.sh --prefix=/usr
    make
}

package() {
    cd "${_pkgname}"
    make DESTDIR="$pkgdir" install
}
