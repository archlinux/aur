# Maintainer: Nora Maguire <eva@rigel.moe>
# Contributor: Sean Snell <ssnell@lakecs.net>

pkgname=streamcontroller-plugin-tools-git
gitname=streamcontroller-plugin-tools
pkgver=2.0.0
pkgrel=6
pkgdesc="Base for StreamController plugins"
arch=('x86_64')
url="https://github.com/StreamController/streamcontroller-plugin-tools"
license=('GPL')
depends=('python-rpyc' 'python-loguru')
makedepend=('python-build','python-installer')
provides=('streamcontroller-plugin-tools')
source=("${gitname}-${pkgver}.tar.gz::https://github.com/StreamController/streamcontroller-plugin-tools/archive/refs/tags/${pkgver}.tar.gz")

# Upstream tar.gz

sha512sums=('19a90d813f7ec3286e3b08b4141c2ad6776d1e949e370018edd4273ded2db3f22271353c38ad1efe90e9de1e39d4f62dfa1271e81cceb8b11772da264f2090d0')

build() {
  cd "${srcdir}"/"${gitname}"-"${pkgver}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  python -m installer --destdir="${pkgdir}" "${srcdir}"/"${gitname}"-"${pkgver}"/dist/*.whl
}