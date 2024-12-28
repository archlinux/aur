# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-vulkan-git
pkgver=1.3.275.1.r1.g3dff490
pkgrel=2
pkgdesc="The ultimate Python binding for Vulkan API"
arch=(any)
url="https://github.com/realitix/vulkan"
license=(Apache-2.0)
depends=(python python-cffi vulkan-icd-loader)
makedepends=(git python-build python-wheel python-installer python-setuptools)
provides=(python-vulkan)
conflicts=(python-vulkan)
source=("python-vulkan::git+https://github.com/realitix/vulkan.git")
sha256sums=('SKIP')

pkgver() {
  cd python-vulkan
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd python-vulkan
  python -m build --wheel --no-isolation
}

package() {
  cd python-vulkan
  python -m installer --destdir="$pkgdir" dist/*.whl
}
