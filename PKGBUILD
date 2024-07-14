# Maintainer: libele <libele@disroot.org>
# Contributor: Beej <beej@beej.us>

_pkgname=Inform6
pkgname=inform
pkgver=6.42
pkgrel=1
pkgdesc="The Inform 6 compiler"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/DavidKinder/Inform6"
license=('Artistic2.0')
groups=('inform')
checkdepends=('inform-stdlib')
optdepends=('inform-stdlib: Inform 6 standard library'
            'punyinform: a small Inform 6 library'
            'frotz: Z-machine interpreter')
source=("$pkgname-$pkgver.tar.gz"::"https://github.com/DavidKinder/Inform6/archive/refs/tags/v$pkgver.tar.gz"
	'https://ifarchive.org/if-archive/infocom/compilers/inform6/examples/Advent.inf'
	'inform.1')
sha256sums=('2fc206551445a75ff88c3f3bcc68bf5b6580a58dfd9a4446bc488ac2aad73766'
            '08229160f23e43e474973b592d386cffd857c1ed9f0bd96cec616fbdc9486c93'
            '5fb635995933797aeeeb10f4eb52cad86a9c679cf0b5aeac3bfb1909f3ea5ec0')

build() {
  cd "$_pkgname-$pkgver"
  cc -DDefault_Language=\"english\" -DInclude_Directory=\"/usr/share/inform-stdlib\" -DTemporary_Directory=\"/tmp\" -DLINUX -O2 -o "$pkgname" *.c
}

check() {
  "$_pkgname-$pkgver/$pkgname" Advent.inf
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 licence.txt "$pkgdir/usr/share/licenses/$pkgname/ARTISTIC"

  cd "$srcdir"
  install -Dm644 inform.1 "$pkgdir/usr/share/man/man1/inform.1"
}
