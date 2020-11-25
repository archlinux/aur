# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-cling
pkgver=6.21.4
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings (cling backend)"
arch=('x86_64')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LGPLv2+' 'LGPL2.1' 'UoI-NCSA')
depends=('python' 'python-wheel' 'python-pip')
source=("https://files.pythonhosted.org/packages/ac/94/b619d2019cb3d0c96f3df175d4032bc8e765f1bcab12012d7019ea94e229/cppyy_cling-${pkgver}-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('027c3b69cc0b4365b5ea37704499360091372c6fc2e25d830ad0372673a80643')

package() {
  cd $srcdir
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/cppyy_backend"
}

