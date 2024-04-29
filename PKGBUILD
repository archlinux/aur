# Maintainer: Philipp Joram <mail [at] phijor [dot] me>

pkgname='python-soundcloud-v2'
_name=${pkgname#python-}
pkgver=1.3.7
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
sha512sums=('8843a6cafb25df7753a5dd6dd2545d8fd9f8a092102d0904ab5654cb9f54e583e19309daf09ce02ac9269ddf02bd9a8114923952572eeee821faff011f7db100')

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
