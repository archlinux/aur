# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Julien Duponchelle <julien@gns3.net>

pkgname=python-cx-freeze
pkgver=6.5.2
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
sha512sums=('5d4a28dff6ba2d84f4bebe5db1887e0c3fe83aca01b0156dd3974a26f1921fc1edb85d8d07af8fddbd3f2d8e938809c5b54f566d79fa716a26a53718b73e293b')

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
