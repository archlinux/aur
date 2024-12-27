# Maintainer: Tomasz Maciej Nowak <com[dot]gmail[at]tmn505>

# All my PKGBUILDs are managed at https://github.com/tmn505/AUR

pkgname=python-liblivemedia
pkgver=1.0.5
pkgrel=1
pkgdesc='RTSP Proxy Server python module for use in Onvif GUI'
url='https://github.com/sr99622/liblivemedia'
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')
depends=('python')
makedepends=('cmake'
             'git'
             'pybind11'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("git+${url}.git#commit=727a8df805f7ee7308e85dad7e2beec3360b5469")
sha256sums=('33561b2c568aaa0760f6afbdced1f1e965ae9b45c06594d93b7476e35ffa9737')

prepare() {
	cd ${srcdir}/${pkgname#*-}
	sed -e 's,add_subdirectory(pybind11),find_package(pybind11 REQUIRED),' -i CMakeLists.txt
}

pkgver() {
	cd ${srcdir}/${pkgname#*-}
	sed -n -e '/liblivemedia VERSION/p' CMakeLists.txt | sed -e 's/[^0-9,.]*//g'
}

build() {
	cd ${srcdir}/${pkgname#*-}
	python -m build --wheel --no-isolation
}

package() {
	cd ${srcdir}/${pkgname#*-}
	python -m installer --destdir="${pkgdir}" dist/*.whl
}
