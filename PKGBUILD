# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=rnr-fm
pkgver=1.0.5
pkgrel=1
pkgdesc="Text mode file manager combining the best features of ranger and mc"
arch=(any)
url="https://github.com/bugnano/rnr"
license=('GPL3')
depends=(python python-pyxdg python-atomicwrites python-fuzzyfinder python-urwid python-pygments)
makedepends=(python-pip)
optdepends=('archivefs: compressed archive support')
conflicts=(rnr rnr-bin)
source=(https://files.pythonhosted.org/packages/48/d4/09349938a4c4f28ada36d79c43bd55f4756a812fb8705aa2d03b59154f80/rnr-1.0.5-py3-none-any.whl)
md5sums=(8b6d2028d724b577948abbece1e2304c)

package() {
	cd "$srcdir"
	# pypa/pip#3063: pip always checks for a globally installed version.
	/usr/bin/pip --quiet install --root="$pkgdir" \
		--no-deps --ignore-installed --no-warn-script-location \
		"$(ls *.whl)"

	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.sh" "$pkgdir/etc/profile.d/rnr.sh"
	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.fish" "$pkgdir/etc/fish/functions/rnr.fish"
}

