# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cast_control
pkgver=0.11.8.post0
pkgrel=3
epoch=1
pkgdesc="Control Chromecasts from Linux and D-Bus"
arch=('any')
url="https://github.com/alexdelorenzo/cast_control"
license=('AGPL-3.0-or-later')
depends=(
  'python-aiopath'
  'python-appdirs'
  'python-click'
  'python-daemons'
  'python-gobject'
  'python-mpris_server'
  'python-pychromecast>=9.2.0'
  'python-pychromecast<9.3.0' 
  'python-pydbus'
  'python-typing_extensions'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'playerctl: Get the D-Bus name for your device'
  'gnome-shell-extension-mpris-indicator-button: MPRIS indicator for GNOME'
)
conflicts=('chromecast_mpris')
replaces=('chromecast_mpris')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('2f57b84dff0deed53863a345b1f3a56e14e9ad27217d958998d015e3d0d2ac1b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
