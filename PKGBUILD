# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=graphs-git
pkgver=nightly
pkgrel=1
pkgdesc="Plot and manipulate data (Gnome Circle app)"

arch=('x86_64')
url="https://welcome.gnome.org/app/Graphs/"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-matplotlib' 'python-scipy' 'python-numpy' 'python-numexpr' 'python-sympy' 'gobject-introspection')
conflicts=('graphs')
makedepends=('git' 'meson' 'blueprint-compiler' 'gettext' 'vala' 'gobject-introspection-runtime')
source=("$pkgname"::"git+https://gitlab.gnome.org/World/Graphs.git")
sha256sums=('SKIP')

build() {
  cd "${pkgname}"
  meson setup "build/"
  cd "build/"
  meson configure -Dprefix="/usr"
  meson compile
}

package() {
  cd "${pkgname}"
  cd "build/"
  meson install --destdir="${pkgdir}"
}
