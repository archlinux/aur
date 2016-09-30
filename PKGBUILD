pkgname=distribution-gpg-keys
_pkgver=1.7
_rpmrel=1
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="GPG keys used by various Linux distributions to sign packages"
arch=('any')
url="https://github.com/xsuchy/$pkgname"
license=('CC0')
source=("$url/archive/$pkgname-$_pkgver-$_rpmrel.tar.gz")
md5sums=('a27d40c00c2053dd6caf0a0af7405fe4')

# Set to 1 to include GPG keys used by Copr projects
_with_copr=0

prepare() {
	mv "$pkgname-$pkgname-$_pkgver-$_rpmrel" "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"

	# Do not include GPG keys used by Copr projects by default
	((_with_copr)) || rm -r keys/copr

	mkdir -p "$pkgdir/usr/share/$pkgname"
	cp -a keys/* "$pkgdir/usr/share/$pkgname"

	# Do not forget license and documentation files
	install -Dm644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 SOURCES.md "$pkgdir/usr/share/doc/$pkgname/SOURCES.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
