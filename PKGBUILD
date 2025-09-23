# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgbase=libonvif
pkgname=('python-libonvif')
pkgver=3.2.7
pkgrel=1
url='https://github.com/sr99622/libonvif'
license=('LGPL-2.1-or-later')
arch=('i686' 'x86_64')
makedepends=('cmake'
             'git'
             'libxml2'
             'pybind11'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
# _prjrel=3.1.10
source=("git+${url}.git#commit=9f74ed54342f8c5fdb2be162b9c1e6224c3bd8d2")
sha256sums=('84f97c62b612fbf5dd3d5c8916be0a423ad785391814e987c1ac0bf8975dc58d')

prepare() {
	cd ${srcdir}/${pkgbase}/libonvif
	sed -e 's,add_subdirectory(pybind11),find_package(pybind11 REQUIRED),' -i CMakeLists.txt
}

pkgver() {
	cd ${srcdir}/${pkgbase}/libonvif
	sed -n -e '/libonvif VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgbase}/libonvif
	python -m build --wheel --no-isolation
}

package_python-libonvif() {
	pkgdesc='A client side implementation of the ONVIF specification - python library'
	depends=('libxml2' 'python')

	cd ${srcdir}/${pkgbase}/libonvif
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
