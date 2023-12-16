# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor:  Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=mido
pkgname=python-$_name
pkgver=1.3.2
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
sha256sums=('3aea28b6ed730f737d5b12da3578debe9dc50058fa370fe9ceded9189b67c348')

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
