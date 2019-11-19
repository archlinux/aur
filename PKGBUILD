# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=0.7.0
pkgrel=1
pkgdesc='A universal code formatter for JupyterLab.'
arch=('any')
url='https://pypi.org/project/jupyterlab-code-formatter'
license=('MIT')
depends=(jupyterlab)
optdepends=(autopep8 yapf python-isort python-black)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/ryantam626/jupyterlab_code_formatter/master/LICENSE")
md5sums=('da7775941a054872b11f2699d9dc3117'
         'SKIP')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py clean --all
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root "$pkgdir" --skip-build --optimize=1
	install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
