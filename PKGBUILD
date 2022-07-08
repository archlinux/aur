# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_project=QJackCapture
pkgname="${_project,,}"
pkgver=0.1.2
pkgrel=2
pkgdesc='A GUI for easy recording of JACK audio sources using jack_capture'
arch=(any)
url='https://github.com/SpotlightKid/qjackcapture'
license=(GPL)
depends=(hicolor-icon-theme jack_capture python-natsort python-pyjacklib python-pyqt5)
makedepends=(python-setuptools)
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/q/$pkgname/$_project-$pkgver.tar.gz")
sha256sums=('b716cee7917468a8c8589dfb3212ba09bfda43224208c96da25b8243716128bf')

build() {
  cd $_project-$pkgver
  make
}

check() {
  cd $_project-$pkgver
  # smoke test to check runtime environment is ok
  python -m qjackcapture --help > /dev/null
}

package() {
  cd $_project-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}
