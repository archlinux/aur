# Maintainer: Sean Snell <ssnell@lakecs.net>

pkgname=streamcontroller-plugin-tools-git
gitname=streamcontroller-plugin-tools
pkgver=2.0.0
pkgrel=3
pkgdesc="Base for StreamController plugins"
arch=('x86_64')
url="https://github.com/StreamController/streamcontroller-plugin-tools"
license=('GPL')
depends=('python-rpyc' 'python-loguru')
provides=('streamcontroller-plugin-tools')
# source=("${pkgname}-${pkgver}.tar.gz::https://github.com/StreamController/streamcontroller-plugin-tools/archive/refs/tags/v${pkgver}.tar.gz")
source=("${gitname}::git+https://github.com/StreamController/streamcontroller-plugin-tools.git#commit=ac99ff7")

# Upstream tar.gz

sha512sums=('SKIP')

build() {
  cd "${gitname}"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  python -m installer --destdir="${pkgdir}" ${srcdir}/${gitname}/dist/*.whl
  # install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}