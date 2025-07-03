pkgname=python-pythonfmu
pkgver=0.6.9
pkgrel=1
pkgdesc="packaging of Python3.x code as co-simulation FMUs"
url="https://github.com/NTNU-IHB/PythonFMU"
arch=(x86_64)
license=('MIT')
depends=('python')
makedepends=('python-setuptools' 'cmake')
source=("https://github.com/NTNU-IHB/PythonFMU/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('3eca369aaa5f3dde0921a5988456dff4')

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
