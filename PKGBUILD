pkgbase='sslpsk'
pkgname=('python-sslpsk'
         'python2-sslpsk')
pkgver=1.0.0
pkgrel=1
pkgdesc="This module adds TLS-PSK support to the Python 2.7 and 3.x ssl package."
arch=('any')
url="https://github.com/drbild/sslpsk"
license=('Apache 2.0')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/drbild/sslpsk/archive/refs/tags/${pkgver}.tar.gz" )
sha256sums=('49b63093b96602591c44b79545e144efe35fe4936ff53eed7bd93eef048ff595')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
  python2 setup.py build
}

package_python-sslpsk() {
  pkgdesc="This module adds TLS-PSK support to the Python 3.x ssl package."
  depends=('python')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dpm644 README* -t "${pkgdir}/usr/share/doc/${pkgname}/"
  rmdir "$pkgdir"/usr/sslpsk
}

package_python2-sslpsk() {
  pkgdesc="This module adds TLS-PSK support to the Python 2.7 ssl package."
  depends=('python2')

  cd "${srcdir}/${pkgbase}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dpm644 README* -t "${pkgdir}/usr/share/doc/${pkgname}/"
  rmdir "$pkgdir"/usr/sslpsk
}
