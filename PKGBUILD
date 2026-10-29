pkgname=python-denonavr
pkgver=1.3.3
pkgrel=1
pkgdesc="Automation Library for Denon (and Marantz) AVR receivers."
arch=(any)
url="https://github.com/ol-iver/denonavr"
license=('MIT')
depends=('python-asyncstdlib>=3.10.2'
         'python-attrs>=21.2.0'
         'python-defusedxml>=0.7.1'
         'python-ftfy>=6.1.1'
         'python-httpx>=0.21.0'
         'python-netifaces>=0.11.0'
         'python-async-timeout>=5.0.1'
         'python-aiolimiter>=1.2.1')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("https://github.com/ol-iver/denonavr/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('2b5a02e6dab435e815ad71dc8759a45f9da628ad153e112b5d5552c3e7019064')
sha512sums=('5caa1b78840777427c91105122044f7ca9bb3076ecdeb68174524f573c9fa6fc2a9579000d270451b4257e6a9cf32a50db4c83b408957bc19826dc74373259f2')
b2sums=('e198a553cb174250784dbcb0b51af067c5f0614bd21992826f1b82e97fb9a1e58d4cdab68b724a6e9229afb673265c03b2f21c0571f35d97ed28269e9a868d12')

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
