# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=1.0.3
pkgrel=1
pkgdesc='A universal code formatter for JupyterLab.'
arch=('any')
url='https://pypi.org/project/jupyterlab-code-formatter'
license=('MIT')
depends=(
  python
  jupyterlab
  jupyter-notebook
  python-packaging)
optdepends=(
  autopep8
  yapf
  python-isort
  python-black)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ryantam626/jupyterlab_code_formatter/master/LICENSE")
md5sums=('cdca2a5ac09ce432a8f4cd82efbe0c6d'
         'SKIP')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
	install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
