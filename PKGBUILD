# Maintainer: Evgenii Alekseev
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Copypasted from python-requests-unixsocket

pkgname=python-requests-unixsocket2
_pkgname="requests_unixsocket2"
pkgver=0.4.1
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
sha512sums=('ac1e78af4975a6c54af8d4af9eb3791c27f13c61b8b65046f03b82842254c8fb983fa0462368dd67abc0a9ce18caa7c3134d9bbada9ba8549ca0b45388ac80f2')
b2sums=('5451ba191ac8a1e40ab790c66fd43b01fb9f304a7d2ac5a2ddc319c3e95a3809d854d0ddf4fe6e008c15ff8c5ff5f0ee80c61047f53e282085157664adee2753')

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

