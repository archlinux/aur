# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Stefan J. Betz <info@stefan-betz.net>
pkgname='pius'
pkgver='2.1.1'
pkgrel=4
pkgdesc='PGP Individual UID Signer (PIUS)'
arch=('any')
url='http://www.phildev.net/pius/'
license=('GPL2')
install="$pkgname.install"
depends=('python2')
optdepends=('python2-pexpect: interactive mode support')
source=("http://downloads.sourceforge.net/pgpius/$pkgname-$pkgver.tar.bz2"
	"python2.patch"
        "gpg-2.1.patch")
md5sums=('adc49aa7a8afecb37b6ad30b55be00d0'
         '451ef646bd19d49c0205a94ead0b6862'
         'dfe4e05076fd809619da2512ada0ad6d')

build() {
  patch -p1 < python2.patch
  patch -p1 < gpg-2.1.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 README "$pkgdir/usr/share/doc/pius/README"
}
