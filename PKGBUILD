# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

_pkgname=chdkptp
pkgname=${_pkgname}-svn
pkgver=r978
pkgrel=1
pkgdesc="chdkptp is a client application for the CHDK"
arch=(x86_64)
url="https://www.assembla.com/spaces/chdkptp"
license=('GPL' 'MIT')
depends=('lua53' 'libusb-compat')
makedepends=('subversion')
provides=('chdkptp')
conflicts=('chdkptp')
source=("svn+https://subversion.assembla.com/svn/chdkptp/trunk"
	"chdkptp.sh"
	"chdkptp-gui.sh")
sha512sums=('SKIP'
            'dc906ba525ff1dbfece6f8addc4ae60486c72f2acc1b548a2fd99b7e857c491fc98e465d0e98e762fab2da05c1544a555d2634b61b666fd164893f43c5f53fd7'
            'fece021b0c976c0cc6127d331ceb7f20bd63abba3435f23363745d4f459c5e9573b09623368d8d7b401fb4d5ee1a9bd1d42fa7c1a803c25e0eaa41c04063590d')

pkgver() {
  cd "$srcdir/trunk"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/trunk"
  make LUA_LIB=lua5.3 LUA_INCLUDE_DIR=/usr/include/lua5.3
}

package() {
  cd "$srcdir/trunk"
  install -Dm755 chdkptp $pkgdir/usr/lib/chdkptp/chdkptp
  #install -Dm755 chdkptp_gui $pkgdir/usr/lib/chdkptp/chdkptp_gui
  install -dm644 "$pkgdir/usr/lib/chdkptp/lua/extras"
  install -m644 lua/*.lua "$pkgdir"/usr/lib/chdkptp/lua/
  install -m644 lua/extras/*.lua "$pkgdir"/usr/lib/chdkptp/lua/extras/
  install -Dm755 "$srcdir"/chdkptp.sh "$pkgdir"/usr/bin/chdkptp
  install -Dm755 "$srcdir"/chdkptp-gui.sh "$pkgdir"/usr/bin/chdkptp-gui
}

