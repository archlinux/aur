pkgname=python-pythonfmu
pkgver=0.6.5
pkgrel=1
pkgdesc="packaging of Python3.x code as co-simulation FMUs"
url="https://github.com/NTNU-IHB/PythonFMU"
arch=(x86_64)
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cmake')
source=("https://github.com/NTNU-IHB/PythonFMU/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1d0499b7d5896ca753afbf893ce31f8f')

build() {
  cd "${srcdir}"/PythonFMU-$pkgver
  cmake -B build_cmake -S pythonfmu/pythonfmu-export -DCMAKE_BUILD_TYPE=Release
  cmake --build build_cmake
  python setup.py build
}

package() {
  cd "${srcdir}"/PythonFMU-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1
}
