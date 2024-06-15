# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Maintainer: Christian Heusel <gromit@archlinux.org>
# Contributor: Antoine Damhet <antoine.damhet@lse.epita.fr>

pkgname=b4
pkgver=0.14.0
pkgrel=1
pkgdesc='Helper utility to work with patches made available via a public-inbox archive like lore.kernel.org.'
license=('GPL-2.0-or-later')
arch=('any')
url='https://git.kernel.org/pub/scm/utils/b4/b4.git/'
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest')
depends=('python-requests' 'git-filter-repo' 'patatt' 'python')
optdepends=('python-dkim: for dkim signature verification')
source=("https://mirrors.edge.kernel.org/pub/software/devel/b4/${pkgname}-${pkgver}.tar."{xz,sign})
validpgpkeys=('DE0E66E32F1FDD0902666B96E63EDCA9329DD07E')
sha256sums=('b00d66f4f8f95995512445a8f9844a7e10bb11fc595ca9cb2a02d9a634281695'
            'SKIP')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname-$pkgver"/src/tests
	pytest
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	rm -rf "$pkgdir/usr/lib/python3.12/site-packages/tests/"
}
