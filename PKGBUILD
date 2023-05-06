# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_project=QJackCapture
pkgname="${_project,,}"
pkgver=0.2.1
pkgrel=2
pkgdesc='A GUI for easy recording of JACK audio sources using jack_capture'
arch=(any)
url='https://github.com/SpotlightKid/qjackcapture'
license=(GPL)
depends=(hicolor-icon-theme jack_capture python-natsort python-pyjacklib python-pyqt5)
makedepends=(python-build python-installer python-setuptools python-wheel)
groups=(pro-audio)
source=("https://files.pythonhosted.org/packages/source/q/$pkgname/$_project-$pkgver.tar.gz")
sha256sums=('7fbf67b05e2f93ea6b4784fd80b3ca633569b75013c723970e8896746dbbdef8')

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
