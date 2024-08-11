# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-soundcloud-v2'
_name=${pkgname#python-}
pkgver=1.6.0
pkgrel=1
pkgdesc="Python wrapper for the v2 SoundCloud API"
url="https://github.com/7x11x13/soundcloud.py"
arch=('any')
license=('MIT')
depends=(
  'python'
  'python-dateutil'
  'python-dacite'
  'python-requests'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
conflicts=('python-soundcloud')
provides=('python-soundcloud')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('73684165eac42c220ba3e9eb1a102d5b70e1b7e17a876049f553bea7d7d3934852307fe251b464c4c0a8c7098aa9d36ff57e8b7340f2e7c008c892fa4243d25d')

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Install MIT license file:
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
