# Maintainer: aksr <aksr at t-com dot me>
pkgname=mailx-git
pkgver=r134.8d4e5b7
pkgrel=2
pkgdesc='A small mailx clone, optimized to handle large mbox files.'
arch=('i686' 'x86_64')
url='http://litcave.rudi.ir/'
url='http://repo.or.cz/w/mailx.git'
license=('custom:BSD')
makedepends=('git')
optdepends=('pop3-git: A simple pop3 mail client.' 
            'smtp-git: A simple smtp mail sender.')
checkdepends=()
provides=("${pkgname%-*}")
install="${pkgname}".install
source=("$pkgname::git://repo.or.cz/mailx.git" config.h)
md5sums=('SKIP'
         '7972f21dfbe0d3dcaee90bc217edd389')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir/$pkgname
	cp ../config.h config.h
}

build() {
	cd $srcdir/$pkgname
	make
}

package() {
	cd "$srcdir/$pkgname"
	install -Dm755 mailx  $pkgdir/usr/bin/neatmailx
	install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}
