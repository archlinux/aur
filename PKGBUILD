# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rofimoji-git
pkgver=4.3.0.r6.g0614fe8
pkgrel=1
pkgdesc='Character picker for rofi'
arch=('any')
url=https://github.com/fdw/rofimoji
license=('MIT')
depends=('emoji-font' 'python-configargparse' 'python-xdg' 'rofi')
makedepends=('git' 'python-pip' 'python-setuptools' 'python-wheel')
optdepends=('wl-copy: for the Wayland clipboarder'
            'wtype: for the Wayland typer'
            'xclip: for one of the X.Org clipboarders'
            'xsel: for one of the X.Org clipboarders'
            'xdotool: for the X.Org typer')
provides=('rofimoji')
conflicts=('rofimoji')
install=$pkgname.install
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd rofimoji
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd rofimoji
  python setup.py bdist_wheel
}

package() {
  cd rofimoji
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
}

# vim:set ts=2 sw=2 et:
