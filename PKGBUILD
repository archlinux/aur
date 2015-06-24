# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=nuclide-server
pkgver=0.0.21
pkgrel=1
pkgdesc="Server-side functionality required by Nuclide to support remote file editing."
arch=('i686' 'x86_64')
url="http://nuclide.io"
license=('CUSTOM')
depends=('nodejs' 'python2')
makedepends=('npm' 'git')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz
        LICENSE-$pkgver::https://github.com/facebook/nuclide/raw/v$pkgver/LICENSE)
noextract=($pkgname-$pkgver.tgz)

package() {
	PYTHON=python2 \
		npm install -g --user root --prefix "$pkgdir"/usr $pkgname-$pkgver.tgz

	install -Dm644 LICENSE-$pkgver "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

	rm -rf "$pkgdir"/usr/etc
	chmod -R go-w "$pkgdir"
	find "$pkgdir" -type f -name package.json -exec chmod a-x {} \;

	sed '1 s/env python$/env python2/' -i \
		"$pkgdir"/usr/lib/node_modules/nuclide-server/scripts/*.py
}

sha256sums=('faf3ce725d5c016bf6b90823a0bd76a9ad3e4d2fa3de2ad1cb5f1d9e7f69626a'
            '5c048a02821e17560bd70882074b3301c98ed3c03793ef1d030ebf1a50ac3355')
