# Maintainer: Martin Larralde <martin.larralde@embl.de>

_name=pyrodigal-gv
_pyname=${_name//-/_}
pkgname=python-${_name}
pkgver=0.3.2
pkgrel=1
pkgdesc="A Pyrodigal extension to predict genes in giant viruses and viruses with alternative genetic code."
url="https://github.com/althonos/pyrodigal-gv"
arch=('any')
license=("GPL3")
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-packaging')
depends=('python' 'python-pyrodigal')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_pyname-$pkgver.tar.gz")
sha256sums=('aeeff43daec2c4aec7830ae2400799aa90bf273bcca86656ef239bee8d7e5ea5')

build() {
    cd "${srcdir}/${_pyname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    python -m installer --destdir="$pkgdir" "${srcdir}/${_pyname}-${pkgver}/dist/${_pyname}-${pkgver}-py2.py3-none-any.whl"
    install -Dm644 "${srcdir}/${_pyname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
