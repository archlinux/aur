# Maintainer: Bipin Kumar <kbipinkumar@pm.me>

pkgname=nanomath
_module=nanomath
pkgver=1.3.0
pkgrel=2
pkgdesc="simple math function for other Oxford Nanopore processing scripts"
url="https://github.com/wdecoster/nanomath/"
depends=(
         'python'
         'python-pandas'
         'python-numpy'
         'python-deprecated'
        )

makedepends=(
             'python-setuptools'
             'python-wheel'
             'python-build'
             'cython'
             'python-installer'
            )
license=('GPL3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c35a024b10b34dd8f539cefed1fd69e0a46d18037ca48bed63c7941c67ae028e')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm ${pkgdir}/usr/LICENSE
}
