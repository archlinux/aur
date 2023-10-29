# Maintainer: aksr <aksr at t-com dot me>
pkgname=pop3-git
pkgver=0.r49.24617c2
pkgrel=1
pkgdesc='A simple pop3 mail client.'
arch=('i686' 'x86_64')
url='http://litcave.rudi.ir/'
url='http://repo.or.cz/w/pop3.git'
license=('custom:BSD')
depends=('openssl')
makedepends=('git')
conflicts=("${pkgname%-*}")
install="${pkgname}".install
source=("$pkgname::git://repo.or.cz/pop3.git" 'conf.h')
md5sums=('SKIP'
         '8fb31130a77406cea9b4ac67dc2b640b')
sha1sums=('SKIP'
          'afe7f13c75b5a555a10d23842f4b7a9e28c11e64')
sha256sums=('SKIP'
            '5afa840066dbda15f614f1c84d53620651c7357de3d66d5855a0b9176e9132e0')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $srcdir
	cp conf.h $pkgname/conf.h
	cd $srcdir/$pkgname
	sed -i 's/chmod 100/chmod 755/' Makefile
}

build() {
	cd "$srcdir/$pkgname"
	make all
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m755 pop3 $pkgdir/usr/bin/pop3
}
