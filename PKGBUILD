# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur at chrisarndt dot de>

_name=miditk-smf
pkgname=python-miditk-smf
pkgver=0.3.0
pkgrel=2
pkgdesc='A Python toolkit for working with Standard MIDI files'
url='https://github.com/SpotlightKid/miditk-smf'
arch=(any)
license=(MIT)
depends=(python)
makedepends=(python-build python-hatchling python-installer)
checkdepends=(python-pytest)
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('900e400aaa88ba47da6b04cfeeb77974367ae4cc2c65766980e8e576909ccba6')

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
