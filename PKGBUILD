# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjapicula
pkgver=0.4
pkgrel=1
pkgdesc="Project Apicula bitstream documentation for Gowin FPGAs"
arch=('i686' 'x86_64')
url="https://github.com/YosysHQ/apicula"
license=('MIT')
depends=('python>=3.6' 'python-numpy' 'python-pandas' 'python-pillow' 'python-crcmod' 'python-openpyxl')
makedepends=('python-setuptools')
provides=('prjapicula')
_name=Apycula
source=("apicula-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        'version.patch')
sha256sums=('f865579aaa05f6bfc63efd92eca3fe3d34b65937ae6e12c135a03d317c39951a'
            '6089234e1e483d9d44801ce3b03e52217d459e2f7bd054128369e5bda4086f6e')

prepare() {
  cd "$srcdir/Apycula-$pkgver"

  patch -p1 < ../version.patch
}

build() {
  cd "$srcdir/Apycula-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/Apycula-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
