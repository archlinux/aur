# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=rnr-fm
pkgver=1.0.3
pkgrel=1
pkgdesc="Text mode file manager combining the best features of ranger and mc"
arch=(any)
url="https://github.com/bugnano/rnr"
license=('GPL3')
depends=(python python-pyxdg python-atomicwrites python-fuzzyfinder python-urwid python-pygments)
makedepends=(python-pip)
optdepends=('archivemount: compressed archive support')
conflicts=(rnr rnr-bin)
source=(https://files.pythonhosted.org/packages/ea/5a/7e0090dbc6803e4a4168da8b06208861482baa1e038c4aa154d0c451e939/rnr-1.0.3-py3-none-any.whl)
md5sums=(c5aca5da6abb1d464e2a10b88d116d0d)

package() {
	cd "$srcdir"
	# pypa/pip#3063: pip always checks for a globally installed version.
	/usr/bin/pip --quiet install --root="$pkgdir" \
		--no-deps --ignore-installed --no-warn-script-location \
		"$(ls *.whl)"

	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.sh" "$pkgdir/etc/profile.d/rnr.sh"
	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.fish" "$pkgdir/etc/fish/functions/rnr.fish"
}

