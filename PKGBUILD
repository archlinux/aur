pkgname=gnome-shell-extension-gnome-clipboard-git
pkgver=70.r152.g5ab1787
pkgrel=1
pkgdesc='GNOME Shell extension for clipboard history'
arch=('any')
url='https://github.com/foss-desk/gnome-clipboard'
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=('typescript' 'gettext')
_commit=5ab17870607ffa2430b0817720a50ac75d01b17a
source=("${pkgname}-${_commit}.tar.gz::https://github.com/foss-desk/gnome-clipboard/archive/${_commit}.tar.gz")
sha256sums=('930ac0897d2b4d41d54343f12e4e581cec62b6c89b55dc088f21a8eb60e9c182')

build() {
  cd "gnome-clipboard-${_commit}"
  command -v tsc >/dev/null
  bash scripts/transpile.sh
  glib-compile-schemas dist/schemas
}

package() {
  cd "gnome-clipboard-${_commit}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/gnome-clipboard@b00f.github.io"
  cp -a dist/. "$pkgdir/usr/share/gnome-shell/extensions/gnome-clipboard@b00f.github.io/"
}
