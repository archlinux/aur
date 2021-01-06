# Maintainer: Franco Bugnano <franco@bugnano.it>

pkgname=rnr-fm
pkgver=1.0.2
pkgrel=1
pkgdesc="Text mode file manager combining the best features of ranger and mc"
arch=(any)
url="https://github.com/bugnano/rnr"
license=('GPL3')
depends=(python python-pyxdg python-atomicwrites python-fuzzyfinder python-urwid python-pygments)
makedepends=(python-pip)
optdepends=('archivemount: compressed archive support')
conflicts=(rnr rnr-bin)
source=(https://files.pythonhosted.org/packages/a5/7d/d43f2564523f4aef28b0796c41e68c288dc3a2f8b6011fd5b549d7383673/rnr-1.0.2-py3-none-any.whl)
md5sums=(f4fd51a4c0f668dc85d8341d012c5c98)

package() {
	cd "$srcdir"
	# pypa/pip#3063: pip always checks for a globally installed version.
	/usr/bin/pip --quiet install --root="$pkgdir" \
		--no-deps --ignore-installed --no-warn-script-location \
		"$(ls *.whl)"

	mv "$pkgdir/usr/man" "$pkgdir/usr/share/man"
	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.sh" "$pkgdir/etc/profile.d/rnr.sh"
	install -D -m644 "$(ls -d *.data)/data/share/rnr/rnr.fish" "$pkgdir/etc/fish/functions/rnr.fish"
}

