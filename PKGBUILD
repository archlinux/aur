# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
# Contributor: Daenyth <Daenyth+Arch [at] gmail [dot] com>
pkgname=rakudo
pkgver=2017.01
pkgrel=1
pkgdesc="Perl6 compiler for MoarVM"
arch=('i686' 'x86_64')
url='http://rakudo.org/'
license=(PerlArtistic)
groups=('perl6')
depends=("nqp>=$pkgver")
makedepends=('perl>=5.8')
provides=('rakudo-moarvm' 'perl6')
replaces=('rakudo-moarvm')
conflicts=('rakudo-moarvm')
options=('!makeflags')
source=("http://rakudo.org/downloads/$pkgname/$pkgname-$pkgver.tar.gz")
sha512sums=('4de0ce2534cde19676b7f1d88dd80d1c4ad65ba16c86eba97dac09d703fa0aade6d163ec5cbfc2226b6b6bf096121100c2f3fea4202b6e071b5e96077ecaa6bf')

build() {
	cd "$pkgname-$pkgver"
	perl Configure.pl --prefix=/usr --backends=moar
	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	find "$pkgdir"/usr/share/perl6/precomp -type f -exec env _pkgdir="$pkgdir" perl -pe 's/\Q$ENV{_pkgdir}//g' -i '{}' '+'
}
