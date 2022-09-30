# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor:  Christopher Arndt <aur -at- chrisarndt -dot- de>

_name='mido'
pkgname=python-$_name
pkgver=1.2.10
pkgrel=3
pkgdesc='A Python library for working with MIDI messages and ports'
url='https://mido.readthedocs.io/'
arch=(any)
depends=(python-rtmidi)
makedepends=(python-setuptools)
optdepends=(
  'portmidi: for PortMidi support'
  'python-pygame: for PortMidi support'
)
license=(MIT)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('17b38a8e4594497b850ec6e78b848eac3661706bfc49d484a36d91335a373499')

build() {
  cd $_name-$pkgver
  python setup.py build
}

package() {
  cd $_name-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  # license
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
