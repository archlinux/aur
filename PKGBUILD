# Maintainer: libele <libele@disroot.org>
# Contributor: Beej <beej@beej.us>

pkgname=inform
_pkgver=6.42-r1
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="The Inform 6 compiler, standard library, and PunyInform library"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://gitlab.com/DavidGriffith/inform6unix"
license=('Artistic2.0' 'MIT')
groups=(inform)
makedepends=('frotz' 'ruby')
optdepends=('perl: for blorb scripts')
provides=('punyinform=5.0')
source=("http://ifarchive.org/if-archive/infocom/compilers/inform6/source/${pkgname}-${_pkgver}.tar.gz")
md5sums=('a23e5dab40cf1a156e51cbe9e3e5bfb9')
sha256sums=('25968c840e0cf9f0e0939dad582268906f49fdad7e1501cbefe571013e0f810a')

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
