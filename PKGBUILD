# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=gnome-shell-extension-alphabetical-grid-extension-git
pkgver=13.0.r23.g72eb153
pkgrel=1
pkgdesc="Restore the alphabetical ordering of the app grid, removed in GNOME 3.38 "
arch=('any')
url="https://github.com/stuarthayhurst/alphabetical-grid-extension"
license=('GPL3')
depends=('gnome-shell>=3.38')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
_source=alphabetical-grid-extension
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_source}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${_source}"
  make build
}

package() {
  _uuid='AlphabeticalAppGrid@stuarthayhurst'
  _install_dir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  install -d ${_install_dir}
  cd "$srcdir/${_source}"
  unzip ${_uuid}.shell-extension.zip -d ${_install_dir}
  install -Dm644 "schemas/org.gnome.shell.extensions.AlphabeticalAppGrid.gschema.xml" -t "${pkgdir}/usr/share/glib-2.0/schemas/"

  install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
