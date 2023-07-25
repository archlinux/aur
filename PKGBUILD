# Maintainer: Jan Holthuis <jan dot holthuis at ruhr-uni-bochum dot de>
pkgname=python-pandoc-latex-environment
pkgver=1.1.6.2
pkgrel=1
pkgdesc="A pandoc filter for adding LaTeX environement on specific HTML div tags."
arch=(any)
url="https://github.com/chdemko/pandoc-latex-environment"
license=(BSD)
depends=('python' 'python-panflute')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-poetry-core>=1.2')
makedepends=('python-pytest')
source=("https://github.com/chdemko/pandoc-latex-environment/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ad1df8288d026014d567c639386059e125fad00f7e19c8d15dd5f9b18d4f62fb')

build() {
    cd "pandoc-latex-environment-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "pandoc-latex-environment-${pkgver}"
    PYTHONPATH="$PWD" pytest
}

package() {
    cd "pandoc-latex-environment-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" LICENSE README.md
}
