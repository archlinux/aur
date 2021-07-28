# Maintainer: Ke Liu <spcter119 AT gmail.com>

pkgname=jupyterlab-plotly
_name=${pkgname#jupyterlab-}
pkgver=5.1.0
pkgrel=1
pkgdesc='Jupyter Extension for Plotly.py.'
arch=(any)
url=https://pypi.org/project/$_names
license=(MIT)
depends=(python jupyterlab jupyter-nbformat)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz)
sha256sums=('71f6744acdc524c22236c226d7cf1072d1a58ebacaf749c640998298472c8c44')

package() {
  cd $srcdir/$_name-$pkgver
  mkdir -p $pkgdir/usr/share/jupyter/{nb,lab}extensions
  cp -r jupyterlab_plotly/nbextension $pkgdir/usr/share/jupyter/nbextensions/$pkgname
  cp -r jupyterlab_plotly/labextension $pkgdir/usr/share/jupyter/labextensions/$pkgname
  mkdir -p $pkgdir/etc/jupyter/nbconfig/notebook.d
  python -c "import json; print(json.dumps({'load_extensions': {'nbserver_extensions': {'jupyterlab-plotly/extension': True}}}, indent=2))" > $pkgdir/etc/jupyter/nbconfig/notebook.d/${pkgname}.json
}
