# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=rnr-fm
pkgver=1.0.8
pkgrel=1
pkgdesc="Text mode file manager combining the best features of ranger and mc"
arch=(any)
url="https://github.com/bugnano/rnr"
license=('GPL3')
depends=(python python-pyxdg python-atomicwrites python-fuzzyfinder python-urwid python-pygments)
makedepends=(python-pip)
optdepends=('archivefs: compressed archive support')
conflicts=(rnr rnr-bin)
source=(https://files.pythonhosted.org/packages/04/0d/65333fd58563f2111d429e2ce29d1effe9fffbb601adda109fca27a9b71e/rnr-1.0.8-py3-none-any.whl)
md5sums=(bfbac7b4eee41801338e56088ff38aaa)
package() {
	cd "$srcdir"
	# pypa/pip#3063: pip always checks for a globally installed version.
	/usr/bin/pip --quiet install --root="$pkgdir" \
		--no-deps --ignore-installed --no-warn-script-location \
		"$(ls *.whl)"

	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.sh" "$pkgdir/etc/profile.d/rnr.sh"
	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.fish" "$pkgdir/etc/fish/functions/rnr.fish"
}

