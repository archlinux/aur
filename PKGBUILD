pkgname=python-denonavr
pkgver=1.1.0
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
sha256sums=('085efb91bbe823381c2b3043a200f0da56b578c33c190be263bac76f73463ff8')
sha512sums=('1e6161165d71fb915e5b1129dab9aba1da100836dde67ead316b13b209c4a2f5158daac58af8bbc604f9782fd9a3c36849b4475e86777aa636fb727bf37aa674')
b2sums=('3890c611fcac581b33f82724a1ab0ac2e37e8f5582096085a1a93e468ebca766b4445110d003fc764d3a323dafac6f79ca3e8e3ca77f6cffdbe1261819b971ea')

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
