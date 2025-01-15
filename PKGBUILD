# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=python-kankakee
pkgver=1.0.2
pkgrel=1
pkgdesc='Server/Client python module for Onvif GUI'
url='https://github.com/sr99622/kankakee'
license=('Apache-2.0')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('cmake'
             'git'
             'pybind11'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("git+${url}.git#commit=c9d3135577c85567cb03419479645bd470f60729")
sha256sums=('a9ce3719dc3a873a6d796489fad037dfb85812e046a1c199eb65217013c25d4f')

prepare() {
	cd ${srcdir}/${pkgname#*-}
	sed -e 's,add_subdirectory(pybind11),find_package(pybind11 REQUIRED),' -i CMakeLists.txt
}

pkgver() {
	cd ${srcdir}/${pkgname#*-}
	sed -n -e '/kankakee VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgname#*-}
	python -m build --wheel --no-isolation
}

package() {
	cd ${srcdir}/${pkgname#*-}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
