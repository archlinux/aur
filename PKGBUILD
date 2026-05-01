# Maintainer: libele <libele@disroot.org>
# Contributor: Beej <beej@beej.us>

_pkgname=Inform6
pkgname=inform
pkgver=6.44
pkgrel=2
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
sha256sums=('4096da66193e35834e9b6d99bf58681e833ae20e747c3aa7352dba7975d172d0'
            '08229160f23e43e474973b592d386cffd857c1ed9f0bd96cec616fbdc9486c93'
            '43ecdb931b738dc8d370a35dae9a9c692a0093242e60efad659476b68bf40662')

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
