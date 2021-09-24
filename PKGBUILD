# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=legit
pkgver=3.1.0
pkgrel=1
pkgdesc="CLI tool to add licenses to projects"
arch=('any')
url='https://github.com/captainsafia/legit'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
options=('!emptydirs')
source=("$pkgname-$pkgver.tgz::https://registry.npmjs.org/@captainsafia/legit/-/legit-$pkgver.tgz")
noextract=("${pkgname}-${pkgver}.tar.gz")
sha256sums=('b99d3f778c00d4bd819c73ae961e15cbf3138405c5f99176dc7643326df1488f')

PURGE_TARGETS+=(usr/lib/modules/@captainsafia/legit *.md *.xml *.yml)

package() {
	export NODE_ENV=production
	npm install -g --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "$pkgname-$pkgver.tgz"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s "/usr/lib/node_modules/@captainsafia/legit/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
	chown -R root:root "$pkgdir/"
}
