pkgname=python-pythonfmu
pkgver=0.6.2
pkgrel=2
pkgdesc="packaging of Python3.x code as co-simulation FMUs"
url="https://github.com/NTNU-IHB/PythonFMU"
arch=(x86_64)
license=('MIT')
depends=('python-fmpy')
makedepends=('python-setuptools' 'cmake')
source=("https://github.com/NTNU-IHB/PythonFMU/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('1193be306ea231dd0786d72037d0669b')

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
