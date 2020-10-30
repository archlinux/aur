# Maintainer: Joachim Desroches <joachim.desroches@epfl.ch>

pkgname=sintl
pkgver=0.2.11
pkgrel=3
pkgdesc='A tool for translating HTML5 web pages.'
arch=('any')
url='https://kristaps.bsd.lv/sintl/'
license=('custom')
depends=('expat')
makedepends=('bmake')
source=('https://kristaps.bsd.lv/sintl/snapshots/sintl.tar.gz'
        'LICENSE')
sha512sums=('5a22cd8266568798d6f045dcce47bd0e1c0949ab8515a1a08f616435eae0042dc941a2c995d3a90d43537dbfa50eaab6845ce4faa0d85f93b4dbfebe2bb547e9'
            'af0d7b2fbe4908d9e858cf8d483d088d7a6ee0c0ea9bea036c9c2bb438b1037d7297239dadfa398b79671ea565f5d3d9b7c5315c73333b9e3e971cdbb0b4419a')

build()
{
	cd "$pkgname-$pkgver"
	./configure PREFIX="/usr" MANDIR="/usr/share/man"
	bmake
}

check()
{
	cd "$pkgname-$pkgver"
	bmake regress
}

package()
{
	cd "$pkgname-$pkgver"
	pwd
	bmake install DESTDIR="$pkgdir"
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
