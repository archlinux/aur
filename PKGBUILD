# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>

pkgname=python-cx-freeze
pkgver=6.7
pkgrel=1
pkgdesc='Create standalone executables from Python scripts'
arch=('x86_64')
url='https://marcelotduarte.github.io/cx_Freeze'
license=('PSF')
depends=('python-importlib-metadata')
makedepends=('python-setuptools')
checkdepends=('python-nose' 'python-openpyxl')
replaces=('python-cx_freeze')
provides=('python-cx_freeze')
conflicts=('python-cx_freeze')
source=("https://github.com/marcelotduarte/cx_Freeze/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('e4b7a1ff58fc5024ae57b6ba05ca01ebbd98eb1b3a234ea1167ce0dacfa79ff748a0425483f4f639dee417371edf59277740a8c55208187b2dfe36eb72ab2742')

prepare() {
  cd cx_Freeze-$pkgver
  # https://github.com/marcelotduarte/cx_Freeze/pull/833
  sed -i 's/excludes$/excludes or []/' cx_Freeze/finder.py
}

build() {
  cd cx_Freeze-$pkgver
  python setup.py build
}

check() {
  cd cx_Freeze-$pkgver
  python setup.py nosetests || echo "Tests failed"
}

package() {
  cd cx_Freeze-$pkgver
  python setup.py install --root "$pkgdir" --optimize 1 --skip-build
}
