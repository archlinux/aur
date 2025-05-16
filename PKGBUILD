# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=python-kankakee
pkgver=1.0.3
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
source=("git+${url}.git#commit=393f14ec19b84352ec0eab9f3427d1804df0aa85")
sha256sums=('03e55a6dfd52aaa46f3e1567310fc16059edcacf59b331ce57be4a1ed82a7463')

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
