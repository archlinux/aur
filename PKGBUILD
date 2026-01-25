pkgname=python-denonavr
pkgver=1.2.0
pkgrel=1
pkgdesc="Automation Library for Denon (and Marantz) AVR receivers."
arch=(any)
url="https://github.com/ol-iver/denonavr"
license=('MIT')
depends=('python-asyncstdlib>=3.10.2'
         'python-attrs>=21.2.1'
         'python-defusedxml>=0.7.1'
         'python-ftfy>=6.1.1'
         'python-httpx>=0.21.0'
         'python-netifaces>=0.11.0'
         'python-async-timeout>=4.0.2')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/ol-iver/denonavr/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e221e1c67682cda115be8a907d4277aa508b007322f181e425d7c1c7cbe1865d')
sha512sums=('3497d039e6fee52dd24c559f2ed822b9392d9d833da0ff25141ea0326accdc8f8eec79c78c91c4b3abafe32a4f598cffd6724f03d37803df2effd35f8d65c6bf')
b2sums=('1fdea0c39da76cc00ea28f19f305ea2a0ca2ede97239d993f6674089c0346e36912af432cfa1cdcb1d9f7c304e0779bbaec2dbae572868eeecc28397f62bffed')

build() {
  cd ${srcdir}/denonavr-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/denonavr-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -v -m755 -d "${pkgdir}/usr/share/licenses/denonavr"
  install -v -m644 ./LICENSE "${pkgdir}/usr/share/licenses/denonavr/"
}
