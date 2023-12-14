# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor:  Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=mido
pkgname=python-$_name
pkgver=1.3.1
pkgrel=1
pkgdesc='A Python library for working with MIDI messages and ports'
url='https://mido.readthedocs.io/'
arch=(any)
depends=(python-importlib-metadata python-packaging python-rtmidi)
makedepends=(python-build python-installer python-setuptools python-setuptools-scm python-wheel)
optdepends=(
  'portmidi: for PortMidi support'
  'python-pygame: for PortMidi support'
)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ebbcfb17d7c629371ae46d1db27ea5a128e6a3ef117b422787f0bab99a8e3120')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  # license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
