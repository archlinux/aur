# Maintainer: Richard Petri <git@rpls.de>
pkgname=prjapicula
pkgver=0.2a1
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
sha256sums=('dc4de568bb20a32718f3813c377d7f18ab4992e6e24730e7a97d58db91443ffd'
            'a51d41482737d43057c6c980e3dad3186f5bb9ca7d2c84badc55338634e60428')

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
