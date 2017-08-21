pkgname=distribution-gpg-keys
_pkgver=1.14
_rpmrel=1
_pkgtag=$pkgname-$_pkgver-$_rpmrel
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="GPG keys used by various Linux distributions to sign packages"
arch=('any')
url="https://github.com/xsuchy/$pkgname"
license=('CC0')
source=("$url/archive/$_pkgtag.tar.gz")
md5sums=('81fc749ca1ce154dbac5e410fb61715a')

# Uncomment to include GPG keys used by Copr projects
#_with_copr=1

prepare() {
	mv "$pkgname-$_pkgtag" "$pkgname-$pkgver"
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
