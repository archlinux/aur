# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=python-kankakee
pkgver=1.0.1
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
source=("git+${url}.git#commit=1e12980c32fc6d3bd2b8652cd30a11252035ad46")
sha256sums=('3ae985ba79ca1aba4de05a11403ecb28570257fb295208c2261fc1b87c293211')

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
