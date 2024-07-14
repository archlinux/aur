# Maintainer: libele <libele@disroot.org>

_pkgname=inform
pkgname=inform6unix
_pkgver=6.42-r2
pkgver="${_pkgver//-/.}"
pkgrel=2
pkgdesc="The Inform 6 compiler, standard library, and PunyInform library"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://gitlab.com/DavidGriffith/inform6unix"
license=('Artistic2.0' 'MIT')
groups=(inform)
makedepends=('frotz' 'ruby')
optdepends=('perl: for blorb scripts')
conflicts=('inform' 'inform-stdlib' 'punyinform')
source=("http://ifarchive.org/if-archive/infocom/compilers/inform6/source/$_pkgname-$_pkgver.tar.gz")
md5sums=('6ecf7b20a317c4e5a87783fd6e9f6b7e')
sha256sums=('ccd9bbcf69c997168745c67b01df2dd63656f7df68f56147ac49ea94e24b764d')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  make REAL_PREFIX=/usr PREFIX="$pkgdir"/usr install

  cd "$pkgdir/usr/share/inform/std/lib"
  install -Dm644 ARTISTIC "$pkgdir/usr/share/licenses/inform/ARTISTIC"

  cd "$pkgdir/usr/share/inform/punyinform"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/punyinform/LICENSE"

  cd "$pkgdir/usr/man/man1"
  install -Dm644 inform.1 "$pkgdir/usr/share/man/man1/inform.1"
  rm -rf "$pkgdir/usr/man"

  cd "$pkgdir/usr/bin"
  rm pblorb scanblorb
}
