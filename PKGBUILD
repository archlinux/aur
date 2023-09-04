# Maintainer: Septire <mushroomgecko@gmail.com>

pkgname=python-flask-sock
pkgver=0.6.0
pkgrel=1
pkgdesc="WebSocket support for Flask. What makes this extension different than others is that it does not require a greenlet based server (gevent, eventlet) to work."
arch=('any')
url="https://blog.miguelgrinberg.com/"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-flask' 'python-simple-websocket')
source=("https://github.com/miguelgrinberg/flask-sock/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('6378492fa6275caa9bc269a111a0bdefbd1618f3faf15f16b3af4e4ef6f43621')

build()
{
  #  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  cd "flask-sock-${pkgver}"
  python setup.py build
}

package() 
{
  cd "flask-sock-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1
  
  # Install license since the package doesn't include it
  install -Dm 644 "${srcdir}/flask-sock-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
