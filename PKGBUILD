# Maintainer: Ke Liu <spcter119@gmail.com>

pkgname=jupyterlab_code_formatter
pkgver=1.4.3
pkgrel=3
_pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
pkgdesc='A universal code formatter for JupyterLab.'
arch=(any)
url=https://pypi.org/project/jupyterlab-code-formatter
license=(MIT)
depends=(python jupyterlab python-jupyter_packaging)
makedepends=(python-setuptools)
optdepends=(autopep8 yapf python-isort python-black)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
        https://raw.githubusercontent.com/ryantam626/jupyterlab_code_formatter/master/LICENSE)
md5sums=('f0d70901b18bc8dda31bc9057b3f9b89'
         'SKIP')

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
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
