# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=rnr-fm
pkgver=1.0.7
pkgrel=1
pkgdesc="Text mode file manager combining the best features of ranger and mc"
arch=(any)
url="https://github.com/bugnano/rnr"
license=('GPL3')
depends=(python python-pyxdg python-atomicwrites python-fuzzyfinder python-urwid python-pygments)
makedepends=(python-pip)
optdepends=('archivefs: compressed archive support')
conflicts=(rnr rnr-bin)
source=(https://files.pythonhosted.org/packages/46/ce/f8eaa50d514f987e9838cfc99c454b72e69dffcad3c1c9bcb9802b719992/rnr-1.0.7-py3-none-any.whl)
md5sums=(4690440ba98d5ad9cdccbf88ab4d22d6)
package() {
	cd "$srcdir"
	# pypa/pip#3063: pip always checks for a globally installed version.
	/usr/bin/pip --quiet install --root="$pkgdir" \
		--no-deps --ignore-installed --no-warn-script-location \
		"$(ls *.whl)"

	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.sh" "$pkgdir/etc/profile.d/rnr.sh"
	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.fish" "$pkgdir/etc/fish/functions/rnr.fish"
}

