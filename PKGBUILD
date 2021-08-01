# Maintainer: Ke Liu <spcter119 AT gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=1.4.10
pkgrel=1
pkgdesc='A universal code formatter for JupyterLab.'
_ups_dev=ryantam626
arch=(any)
url=https://pypi.org/project/${pkgname//_/-}
license=(MIT)
depends=(python jupyterlab python-jupyter_packaging)
makedepends=(python-setuptools)
optdepends=(autopep8 yapf python-isort python-black)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('1645fd80b99d590d60fe0f3c078c9101ad62dfdbfac5e78b4c2d334896ab526f')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root $pkgdir --skip-build --optimize=1
  mkdir -p $pkgdir/{etc,usr/share/jupyter/labextensions/@$_ups_dev}
  cp -r $pkgname/labextension $pkgdir/usr/share/jupyter/labextensions/@$_ups_dev/$pkgname
  cp -r $srcdir/$pkgname-$pkgver/jupyter-config $pkgdir/etc/jupyter
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
