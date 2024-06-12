# Maintainer: Evgenii Alekseev
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Copypasted from python-requests-unixsocket

pkgname=python-requests-unixsocket2
_pkgname="requests_unixsocket2"
pkgver=0.4.0
pkgrel=1
pkgdesc='Use requests to talk HTTP via a UNIX domain socket, fork of requests-unixsocket'
arch=('any')
url='https://gitlab.com/thelabnyc/requests-unixsocket2'
license=('Apache-2.0')
depends=('python-requests' 'python-urllib3')
makedepends=('python-poetry')
provides=('python-requests-unixsocket')
conflicts=('python-requests-unixsocket')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('e92b2d66e8d9e1f80de1a767a8ceba545bf8a8c1fe7bd75f2c5cb5f7225e6bff5ce60fbc150e9f5820bc312bfb787e94c82b1d0dfe7c4556709c7d3b0497188a')
b2sums=('74923bd914f5c3c8e5cb8aa5e87d6403116e2eb692bb62d0289dc8a8d646c97f67ceb781f7c78d656c2f956f7db2b23ad2d0c23631827337c7cb383381024557')

build() {
  cd "$_pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  # remove tests folder from package
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm -r "$pkgdir$site_packages/requests_unixsocket/"{tests,testutils.py}
}
