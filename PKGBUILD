# Contributor: Loui Chang <louipc [dot.] ist [at@] gmail.com>
# Contributor: aksr <aksr at t-com dot me>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Maintainer: aksr <aksr at t-com dot me>

pkgname=jove-git
pkgver=4.17.5.5
pkgrel=1
epoch=1
pkgdesc='An Emacs-like editor without Lisp'
url='https://github.com/jonmacs/jove/'
license=('LicenseRef-JoveCustomLicense')
arch=('i686' 'x86_64')
depends=('termcap' 'glibc')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("$pkgname::git+$url")
sha256sums=('SKIP')
options=('!buildflags')

pkgver() {
	cd $srcdir/$pkgname
	git describe --tags | sed 's+-+.+'| tr - .
}

build() {
	cd $srcdir/$pkgname
	export CFLAGS="$CFLAGS -Wno-incompatible-pointer-types"
	./jmake.sh
}

package() {
	cd $srcdir/$pkgname
	export CFLAGS="$CFLAGS -Wno-incompatible-pointer-types"
	./jmake.sh JOVEHOME=/usr DESTDIR="$pkgdir" JMANDIR=/usr/share/man/man1 install
	install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-*}"/LICENSE
	chmod o-w "$pkgdir"/var/lib/jove/preserve
}
