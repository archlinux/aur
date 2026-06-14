# Maintainer: Evgenii Alekseev
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Copypasted from python-requests-unixsocket

pkgname=python-requests-unixsocket2
_pkgname="requests_unixsocket2"
pkgver=1.0.1
pkgrel=1
pkgdesc='Use requests to talk HTTP via a UNIX domain socket, fork of requests-unixsocket'
arch=('any')
url='https://gitlab.com/thelabnyc/requests-unixsocket2'
license=('Apache-2.0')
depends=('python-requests' 'python-urllib3')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
provides=('python-requests-unixsocket')
conflicts=('python-requests-unixsocket')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha512sums=('b8d5c054d04893bfad27976c88a2b96ce9cf025728748ae0108ccffcdb661cc3cb3146ee120d091e9b22425c4dd9a232918bf8745de9da9e32dae368da60b2bd')
b2sums=('b56c1be69a10ea79aa6d6d06dcd3fc885456191dc77d62c709bcddc50f7b0b22fe5773ab175f2694452067f58eba914be817d98dea5dd8d6bafcab58b03e6a55')

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

