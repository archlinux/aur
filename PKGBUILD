# Maintainer: Chris Sakalis <chrissakalis@gmail.com>
# Contributor: Petr Špaček <petr.spacek@nic.cz> (fix_binutils234.patch)

pkgname=mutrace
pkgver=0.2
pkgrel=1
pkgdesc="A mutex contention measurement tool"
arch=('i686' 'x86_64')
url="http://0pointer.de/blog/projects/mutrace.html"
license=('GPL')
depends=()
source=('git://git.0pointer.net/mutrace.git#tag=v0.2'
        'fix_headers.patch'
	'fix_binutils234.patch')

sha256sums=('SKIP'
            '61e0db42f2ed3c8655d3bba81bde684aea8f1fe1e1399cb98ef478d2edc13b9e'
            'da7a6f57f2d16da2d84b8483d37dd40c0a55fdd80c69ee3c8b83383f11dc5799')

build()
{
	cd "$srcdir/$pkgname"
	./bootstrap.sh
	patch < ../fix_headers.patch
	patch < ../fix_binutils234.patch
	make
}

package()
{
	cd "$srcdir/$pkgname"
	make prefix="$pkgdir/usr" install
	cd "$srcdir"
}
