# Maintainer: Coelacanthus <coelacanthus@outlook.com>

# rename for same name package in [community]
pkgname=git-grc
_pkgname=gcr
pkgver=1.3.1
pkgrel=1
pkgdesc="Semantic git commits tool. use rust to rewrite the main features of git-cz."
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/sdttttt/gcr"
license=(MIT)
depends=('gcc-libs'
         'git'
         )
makedepends=(cargo)
optdepends=()
# conflict for same file: /usr/bin/grc
conflicts=(grc)
install=$pkgname.install
source=($_pkgname-$pkgver.tar.gz::https://github.com/sdttttt/$_pkgname/archive/v$pkgver.tar.gz)
b2sums=('d9a88c0fca943e13f97df7e898c69bceafd62879ee8a10406bc7e9ec79a8793cac670c8a43625d77d8614c113b1f8431543632d2fecaf4542b961d1dd837bf14')

prepare() {
	cd "$_pkgname-$pkgver"
  cargo update
}

build() {
	return 0
}

package() {
	cd "$_pkgname-$pkgver"
	cargo install --no-track --locked --all-features --root "$pkgdir/usr/" --path .
	#ln -sf "$pkgdir/usr/bin/grc" "$pkgdir/usr/bin/git-cz"
	ln -sf "$pkgdir/usr/bin/grc" "$pkgdir/usr/bin/git-grc"

	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:

