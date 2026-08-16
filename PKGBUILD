# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: muio <muio at airmail dot cc>

pkgname=cmake-init
pkgver=0.41.1
pkgrel=3
pkgdesc="The missing CMake project initializer"
arch=("any")
url="https://github.com/friendlyanon/cmake-init"
license=("GPL-3.0-or-later")
depends=("python>=3.8")
makedepends=("python-build" "python-installer" "python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/friendlyanon/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=("09cb46986b93b576b2c3b1cd1f3b3de76878a40ade3366ca35ad72786148ac784f721af4acccd1a373e73808841391f14bfcaa4829b6a8573c7769a2eb85f982")

# hack until https://github.com/friendlyanon/cmake-init/issues/148 is resolved 
prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}/package"
  sed -i 's|"License :: OSI Approved :: GNU General Public License v3 (GPLv3)",||' setup.py 
  sed -i 's|license_files="\.\./COPYING"|license_files=("COPYING",)|' setup.py
  ln -s ../COPYING COPYING
}

build() {
  cd "${pkgname}-${pkgver}/package"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}/package"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
