# Maintainer: Pantelis Panayiotou <p.panayiotou@gmail.com>

pkgname=graphs
pkgver=1.8.0
pkgrel=1
pkgdesc="Plot and manipulate data (Gnome Circle app)"

arch=('x86_64')
url="https://welcome.gnome.org/app/Graphs/"
license=('GPL-3.0-or-later')
depends=('gtk4' 'libadwaita' 'python-matplotlib' 'python-scipy' 'python-numpy' 'python-numexpr' 'python-sympy' 'gobject-introspection')
conflicts=('graphs-git')
makedepends=('git' 'meson' 'blueprint-compiler' 'gettext' 'vala' 'gobject-introspection-runtime')
source=("https://gitlab.gnome.org/World/Graphs/-/archive/v${pkgver}/Graphs-v${pkgver}.tar.gz")
sha256sums=('fb72387b8c692db434bc50a5cf851405b1d3f6be7cd274e461cecd57d3ac19af')

build() {
  cd "Graphs-v${pkgver}"
  meson setup --buildtype=release "build/"
  cd "build/"
  meson configure -Dprefix="/usr"
  meson compile
}

package() {
  cd "Graphs-v${pkgver}"
  cd "build/"
  meson install --destdir="${pkgdir}"
}
