# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=rofimoji-git
pkgver=5.0.0.r0.gcf82f05
pkgrel=1
pkgdesc='Character picker for rofi'
arch=('any')
url=https://github.com/fdw/rofimoji
license=('MIT')
depends=('python-configargparse')
makedepends=('git' 'python-setuptools')
optdepends=('emoji-font: for the emojis character file'
            'nerd-fonts: for the nerd_font character file'
            'rofi: for the X.Org selector'
            'xclip: for one of the X.Org clipboarders'
            'xsel: for one of the X.Org clipboarders'
            'xdotool: for the X.Org typer'
            'wofi: for the Wayland selector'
            'wl-copy: for the Wayland clipboarder'
            'wtype: for the Wayland typer')
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
  python setup.py build
}

package() {
  cd rofimoji
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}

# vim:set ts=2 sw=2 et:
