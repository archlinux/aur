# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur at chrisarndt dot de>

_name=miditk-smf
pkgname=python-miditk-smf
pkgver=0.3.1
pkgrel=4
pkgdesc='A Python toolkit for working with Standard MIDI files'
url='https://github.com/SpotlightKid/miditk-smf'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-build python-hatchling python-installer)
checkdepends=(python-pytest)
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('5667536d8a0ae5f5d078c78b367d5d7020d79b8c5385dcfb7a2cce04f8b452e1')

build() {
  cd ${_name/-/_}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${_name/-/_}-$pkgver
  python -m pytest -v tests
}

package() {
  cd ${_name/-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # install license
  install -Dm644 LICENSE.md -t "$pkgdir"/usr/share/licenses/$pkgname
}
