# Maintainer: Chris Morgan <aur@chrismorgan.info>

pkgname=python-opentype-feature-freezer
pkgver=1.32.2
pkgrel=1
pkgdesc="Freeze OpenType features in a font"
arch=(any)
url="https://github.com/twardoch/fonttools-opentype-feature-freezer"
license=(Apache-2.0)
depends=("python-fonttools")
makedepends=("python-setuptools")
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/py3/${_name::1}/$_name/${_name//-/_}-$pkgver-py3-none-any.whl"
		"pyftfeatfreeze")
sha256sums=('e49b98c7ab37c8fe75d838319cbc0f4769a06536ec039633f1cded39b813a055'
			'3cfe8882f768de48c204621fdbf5f36cdb7026fc30c60cc764d3c0fca10521f5')

package() {
	sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
	mkdir -p "$pkgdir$sitepackages"
	cp -r "$srcdir/opentype_feature_freezer" "$pkgdir$sitepackages/"
	python -m compileall -s "$pkgdir" "$pkgdir$sitepackages"
	install -Dm755 pyftfeatfreeze "$pkgdir/usr/bin/pyftfeatfreeze"
}
