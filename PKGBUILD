pkgname=distribution-gpg-keys
_pkgver=1.17
_rpmrel=1
_pkgtag=$pkgname-$_pkgver-$_rpmrel
pkgver=$_pkgver.$_rpmrel
pkgrel=1
pkgdesc="GPG keys used by various Linux distributions to sign packages"
arch=('any')
url="https://github.com/xsuchy/$pkgname"
license=('CC0')
source=("$url/archive/$_pkgtag.tar.gz")
md5sums=('ddcf8b69c80678fee257207b67a4ff79')

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
	cp -Rp keys/* "$pkgdir/usr/share/$pkgname"

	# Do not forget license and documentation files
	install -Dp -m644 LICENSE    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dp -m644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dp -m644 SOURCES.md "$pkgdir/usr/share/doc/$pkgname/SOURCES.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
