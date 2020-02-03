# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=cppyy-cling
pkgver=6.18.2.6
pkgrel=1
pkgdesc="Cling-based Python-C++ bindings (cling backend)"
arch=('x86_64')
url="https://cppyy.readthedocs.io/en/latest/index.html"
license=('LGPLv2+' 'LGPL2.1' 'UoI-NCSA')
depends=('python' 'python-wheel' 'python-pip')
source=("https://files.pythonhosted.org/packages/35/9a/b016bf900a196f3ac71608e6629c68a95e92a32de242e8a7acd6590cbf17/cppyy_cling-${pkgver}-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('fd6b5f946d96b35aec8f0579f9f66d3edcf3efe601a4489fdeb4ab3e8693f9ca')

package() {
  cd $srcdir
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/cppyy_backend"
}

