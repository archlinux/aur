# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjapicula
pkgver=0.0.1a11
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
sha256sums=('76aaa483735e14e9780683b9bc978958e08e408c8078f91505f25d78df0d933b'
            'b638b888893c17df834b6b6e47fbd15a6e3aa4689066980d7c7c3b14935c33c4')

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
