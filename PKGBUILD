# Maintainer: detiam <dehe_tian@outlook.com>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>

_pkgname=junction
pkgname=junction-zhfix
pkgdesc="Application/browser chooser (zhfix fork)"
pkgver=1.6.1
pkgrel=1
_tag=v$pkgver
#_commit=0343689c5bf835b27ff18a2490e74e5e4d361e1d
arch=('x86_64' 'aarch64')
url="https://github.com/detiam/Junction-zhfix"
license=('GPL3')
conflicts=("$_pkgname")
provides=("$_pkgname")
depends=('libadwaita' 'libportal-gtk4' 'gjs')
makedepends=('git' 'meson' 'python-gobject' 'blueprint-compiler' 'xdg-utils')
checkdepends=('appstream-glib')
source=("${_pkgname}-${pkgver}::git+${url}.git#tag=${_tag}")
b2sums=('SKIP')

prepare() {
  cd "${_pkgname}-${pkgver}"
  git -c protocol.file.allow=always submodule update --init --recursive
}

build() {
  arch-meson "$_pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
