# Maintainer: libele <libele@disroot.org>

__pkgname=inform
_pkgname=Inform6
pkgname=inform-git
pkgver=6.42.167.g5885e84
pkgrel=2
pkgdesc="The Inform 6 compiler (git version)"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/DavidKinder/Inform6"
license=('Artistic2.0')
provides=('inform=6.42')
conflicts=('inform')
groups=(inform)
makedepends=('git')
checkdepends=('inform-stdlib')
optdepends=('inform-stdlib: Inform 6 standard library'
	    'punyinform: a small Inform 6 library'
	    'frotz: Z-machine interpreter')
source=('git+https://github.com/DavidKinder/Inform6.git'
	'https://ifarchive.org/if-archive/infocom/compilers/inform6/examples/Advent.inf'
	'inform.1')
sha256sums=('SKIP'
            '08229160f23e43e474973b592d386cffd857c1ed9f0bd96cec616fbdc9486c93'
            '5fb635995933797aeeeb10f4eb52cad86a9c679cf0b5aeac3bfb1909f3ea5ec0')

pkgver() {
  cd "$_pkgname"
  printf "%s" "$(git describe --long --tags | sed 's/v//; s/-/./g')"
}

build() {
  cd "$_pkgname"
  cc -DDefault_Language=\"english\" -DInclude_Directory=\"/usr/share/inform-stdlib\" -DTemporary_Directory=\"/tmp\" -DLINUX -O2 -o inform *.c
}

check() {
  "$_pkgname/$__pkgname" Advent.inf
}

package() {
  cd "$_pkgname"
  install -Dm755 "$__pkgname" "$pkgdir/usr/bin/$__pkgname"
  install -Dm644 licence.txt "$pkgdir/usr/share/licenses/$__pkgname/ARTISTIC"

  cd "$srcdir"
  install -Dm644 inform.1 "$pkgdir/usr/share/man/man1/inform.1"
}
