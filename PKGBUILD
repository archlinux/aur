# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=python-rtmidi
pkgdesc='Python bindings for the cross-platform MIDI I/O library RtMidi'
pkgver=1.4.9
pkgrel=2
arch=(x86_64 aarch64)
url='https://github.com/SpotlightKid/python-rtmidi'
license=(MIT)
depends=(python)
makedepends=(alsa-lib cython jack python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('bfeb4ed99d0cccf6fa2837566907652ded7adc1c03b69f2160c9de4082301302')

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  depends+=(libasound.so libjack.so)
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --skip-build --optimize=1
  # license
  install -Dm644 LICENSE.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
