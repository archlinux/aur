# Maintainer: Aleksandar Trifunovic <akstrfn@gmail.com>
# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>
# Contributor: Pierre DOUCET <pierre at equinoxefr.org>

pkgname=pcb2gcode
pkgver=2.3.1
pkgrel=1
pkgdesc="Command-line tool for isolation, routing and drilling of PCBs."
arch=('i686' 'x86_64')
url="https://github.com/pcb2gcode/pcb2gcode"
license=('GPL')
depends=('boost-libs' 'gtkmm' 'glibmm' 'gerbv')
makedepends=('boost')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "patch")
sha256sums=('cf599ea94bf985856707e2bad2b384f378b14a8e8b228474bc60609e30856435'
            '9adab6f0ccd3c9310954d2a49bca41b4733b827d3b53730b6f9a0405dab2071e')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 < ../patch
  autoupdate
  autoreconf -i
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
