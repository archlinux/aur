# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=4.0.2
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://codeberg.org/WhyNotHugo/caffeine-ng"
license=(GPL3)
depends=(
  python-gobject
  python-xdg
  python-dbus
  python-click
  python-ewmh
  gtk3
  libnotify
  python-setproctitle
  python-wheel
  python-pulsectl
  libindicator-gtk3
)
optdepends=(
  "libappindicator-gtk3: AppIndicator support (eg: Plasma, Unity)."
  "xfconf: Support for Xfce presentation mode."
)
makedepends=(
  git
  python-setuptools-scm
  python-build
  python-installer
)
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")

md5sums=('86295a0ddc165e84ab492cc247b6ea43')

build() {
  cd "$srcdir"/caffeine-ng-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir"/caffeine-ng-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  # XXX: Broken: installs shared files into python's site-packages
  #python -m installer --destdir="$pkgdir" dist/*.whl
}
