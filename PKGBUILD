# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-cling
pkgver=6.28.0
pkgrel=2
pkgdesc="Cling-based Python-C++ bindings (cling backend)"
arch=('x86_64')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LGPLv2+' 'LGPL2.1' 'UoI-NCSA')
depends=('python' 'python-wheel' 'python-pip')
source=("https://files.pythonhosted.org/packages/32/1e/b1c53769953c3425bddd16c770399374eb9897333a3fba49f699d17e9526/cppyy_cling-${pkgver}-py2.py3-none-manylinux2014_x86_64.whl")
sha256sums=('6db5ea865207387f52c6beda4f65298137309ffebf9d20fa2281e5fc8dbb3323')

package() {
  cd $srcdir
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/cppyy_backend"
}

