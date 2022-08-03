# Maintainer: libele <libele@disroot.org>
# Contributor: Beej <beej@beej.us>

pkgname=inform
pkgver=6.41.r1
_ifrel="6.41-r1"
pkgrel=2
pkgdesc="The Inform 6 compiler, standard library, and PunyInform library"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://gitlab.com/DavidGriffith/inform6unix"
license=('Artistic2.0' 'MIT')
groups=(inform)
depends=('perl' 'ruby')
provides=('punyinform=4.0')
source=("http://ifarchive.org/if-archive/infocom/compilers/inform6/source/${pkgname}-${_ifrel}.tar.gz")
md5sums=('ce99af3ec4cc1c1ed689682f3e43ab6a')

build() {
  cd "${srcdir}/${pkgname}-${_ifrel}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${pkgname}-${_ifrel}"
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
