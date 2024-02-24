# Maintainer: Ianis Vasilev <ianis@ivasilev.net>
pkgname=dpsprep-git
pkgver=r89.3d4c8c3
pkgrel=3
pkgdesc='A DjVu to PDF converter with a focus on small output size and the ability to preserve document outlines and text layers'
url='https://github.com/kcroker/dpsprep'
arch=('any')
license=('GPL3')
checkdepends=(python ruff mypy python-types-pillow python-types-fpdf2 python-pytest)
makedepends=(git python-build python-installer python-wheel)
depends=(python python-click python-djvulibre python-fpdf2 python-loguru
         python-pillow python-pdfrw)
optdepends=('ocrmypdf: Optional OCR and advanced PDF optimization')
source=('git+https://github.com/kcroker/dpsprep.git')
md5sums=('SKIP')

check() {
    cd "${srcdir}/dpsprep"
    make lint
    make test
}

build() {
    cd "${srcdir}/dpsprep"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/dpsprep"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m755 bin/dpsprep "$pkgdir/usr/bin/dpsprep"
    install -D -m644 dpsprep.1 "$pkgdir/usr/share/man/man1/dpsprep.1"
}
