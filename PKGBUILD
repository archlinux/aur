# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_project=QJackCapture
pkgname="${_project,,}"
pkgver=0.2.0
pkgrel=1
pkgdesc='A GUI for easy recording of JACK audio sources using jack_capture'
arch=(any)
url='https://github.com/SpotlightKid/qjackcapture'
license=(GPL)
depends=(hicolor-icon-theme jack_capture python-natsort python-pyjacklib python-pyqt5)
makedepends=(python-build python-installer python-setuptools python-wheel)
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/q/$pkgname/$_project-$pkgver.tar.gz")
sha256sums=('9e46dfc13f0cdadd1b5dedf5f5de378203f3034bf2198c45cbd56af9b485130a')

build() {
  cd $_project-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd $_project-$pkgver
  # smoke test to check runtime environment is ok
  python -m qjackcapture --help > /dev/null
}

package() {
  cd $_project-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  make PREFIX=/usr DESTDIR="$pkgdir/" install-data
}
