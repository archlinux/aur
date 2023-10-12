# Maintainer: libele <libele@disroot.org>
# Contributor: Beej <beej@beej.us>

pkgname=inform
_pkgver=6.41-r6
pkgver="${_pkgver//-/.}"
pkgrel=2
pkgdesc="The Inform 6 compiler, standard library, and PunyInform library"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://gitlab.com/DavidGriffith/inform6unix"
license=('Artistic2.0' 'MIT')
groups=(inform)
depends=('perl')
makedepends=('frotz' 'ruby')
provides=('punyinform=4.5')
source=("http://ifarchive.org/if-archive/infocom/compilers/inform6/source/${pkgname}-${_pkgver}.tar.gz")
md5sums=('48a56f0a691ea664dd4840d3d034a01b')
sha256sums=('609de4f5cfae611cc8e6f3333d7016bdb2e802fe39096c59db50c5b31e14b557')

build() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${_pkgver}"
  make REAL_PREFIX=/usr PREFIX="${pkgdir}"/usr install

  cd "${pkgdir}"/usr/share/inform/std/lib
  install -Dm644 ARTISTIC "${pkgdir}"/usr/share/licenses/inform/ARTISTIC

  cd "${pkgdir}"/usr/share/inform/punyinform
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/punyinform/LICENSE

  cd "${pkgdir}"/usr/man/man1
  install -Dm644 inform.1 "${pkgdir}"/usr/share/man/man1/inform.1
  rm -rf "${pkgdir}"/usr/man

  cd "${pkgdir}"/usr/bin
  rm pblorb scanblorb
}
