# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=1.4.4
pkgrel=1
pkgdesc='A universal code formatter for JupyterLab.'
arch=(any)
url=https://pypi.org/project/jupyterlab-code-formatter
license=(MIT)
depends=(python jupyterlab python-jupyter_packaging)
makedepends=(python-setuptools)
optdepends=(autopep8 yapf python-isort python-black)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('7cc82ea65b6c0747597662436d4e5de2')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  mkdir -p $pkgdir/{etc,usr/share/jupyter/labextensions/@ryantam626}
  cp -r $pkgname/labextension $pkgdir/usr/share/jupyter/labextensions/@ryantam626/$pkgname
  cp -r $srcdir/$pkgname-$pkgver/jupyter-config $pkgdir/etc/jupyter
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
