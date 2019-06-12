# Maintainer: robertfoster

pkgbase=hyperledger-composer
pkgname=('hyperledger-composer-cli' 'hyperledger-composer-playground')
pkgver=0.20.8
pkgrel=1
pkgdesc="A framework for building Blockchain business networks"
arch=(i686 x86_64)
url="https://github.com/hyperledger/composer"
license=('APACHE')
groups=('hyperledger')
depends=('nodejs-lts-carbon')
makedepends=('npm')

package_hyperledger-composer-cli() {
	pkgdesc="The Hyperledger composer CLIs for administering business networks"

	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" --ignore-scripts --production composer-cli@$pkgver

	msg2 "Renaming composer to composer-cli (it's not php composer)"
	chmod 755 -R $pkgdir/usr/bin/
	mv $pkgdir/usr/bin/composer $pkgdir/usr/bin/composer-cli
}

package_hyperledger-composer-playground() {
	pkgdesc="The UI for Hyperledger Composer"

	cd $srcdir
	local _npmdir="$pkgdir/usr/lib/node_modules/"
	mkdir -p $_npmdir
	cd $_npmdir
	npm install -g --prefix "$pkgdir/usr" --ignore-scripts --production composer-playground@$pkgver
	chmod 755 -R $pkgdir/usr/bin/
}
