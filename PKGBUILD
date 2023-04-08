# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>

pkgname=python-cx-freeze
pkgver=6.12.0
pkgrel=2
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url='https://marcelotduarte.github.io/cx_Freeze'
license=('PSF')
depends=('patchelf' 'python-packaging' 'python-setuptools')
checkdepends=('python-pytest-mock' 'python-bcrypt' 'python-cryptography' 'python-openpyxl'
              'python-pandas' 'python-pillow' 'python-pydantic' 'python-pytz')
replaces=('python-cx_freeze')
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/cx_Freeze/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('a3fdd94b33985b3bb0fbee2fc7438e20f3ddb31f0d71322eed1c06a15954be5845a0b1dfbc55537fe16022db95b446d3fa0b3e8418cd250e653f42a180b8c586')

build() {
  cd cx_Freeze-$pkgver
  python setup.py build
}

check() {
  cd cx_Freeze-$pkgver
  python setup.py egg_info
  # TODO
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-310" python -m pytest --deselect tests/test_command_bdist_rpm.py::test_bdist_rpm
}

package() {
  cd cx_Freeze-$pkgver
  python setup.py install --root "$pkgdir" --optimize 1 --skip-build
}
