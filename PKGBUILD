# Maintainer: Moritz Sauter <moritz.sauter7+aur at gmail dot com>

pkgname=python-rmscene
_name=rmscene
pkgver=0.1.0
pkgrel=1
pkgdesc="Parsing library for *.rm files in version 6."
arch=(any)
url="https://github.com/ricklupton/rmscene"
license=('MIT')
# depends=('python-pdfrw' 'python-reportlab' 'python-svglib')
makedepends=('python-build' 'python-installer' 'python-poetry')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=("d6ae29d6b1e00e996e86d095786f1fd6bf857be7016bb81ae738833a175b24fb")

build() {
    cd "$srcdir"/rmscene-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    _site_packages=$(python -sSc 'import site; print(site.getsitepackages()[0])')

    cd "$srcdir"/rmscene-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
