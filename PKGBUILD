# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-soundcloud-v2'
_name=${pkgname#python-}
pkgver=1.5.4
pkgrel=2
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
sha512sums=('0678905fd8d3b164cc4ceaa80f0a6ac8a8e4b8abad95dfa149d2da7ca83819304be74c9f83f46540ac00ab8366d1a5cfd441c8bb2030c37437f611845faafcb2')

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
