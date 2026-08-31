# Maintainer: Lukas Lipinsky <6032558+Mr-Tao@users.noreply.github.com>

pkgname=androidtvremote2-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc='Native GTK remote control for Android and Google TV devices'
arch=('any')
url='https://github.com/Mr-Tao/androidtvremote2-gtk'
license=('Apache-2.0')
depends=(
  'gtk4'
  'libadwaita'
  'python'
  'python-androidtvremote2'
  'python-gobject'
  'python-zeroconf'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=('python-pytest')
_commit='c7047a4cf2dacb3ac169f2158b5d819b41fee6d9'
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname"
  pytest -q
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
