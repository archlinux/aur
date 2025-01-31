# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ufo2otf
pkgver=0.2.2
pkgrel=6
pkgdesc='Take UFO font sources and generate OTF’s and webfonts'
arch=(any)
url="https://github.com/fonts/$pkgname"
license=(BSD-3-Clause)
depends=(python
         fontforge
         afdko)
makedepends=(python-{build,installer,wheel}
             python-setuptools)
options=(!emptydirs)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz"
        python3.patch)
sha256sums=('180b4e1bbacb5f94338e87c160bf68a0919956c0e31310ad0195d0e6c25d96ca'
            '152396362fb91765a7a34958d24ca521a804df3ade5f0cce27135dfb1c712d62')

prepare () {
	cd "$_archive"
	patch -p1 < ../python3.patch
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE.txt
	rm -f "$pkgdir/usr/README.rst"
}
