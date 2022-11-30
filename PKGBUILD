# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=millionaire
pkgver=1.0.2
pkgrel=1
pkgdesc="Who Wants to Be a Millionaire game"
arch=('x86_64' 'aarch64')
url="https://github.com/martinszeltins/who-wants-to-be-a-millionaire"
license=('GPL2')
depends=('libadwaita')
makedepends=('git' 'blueprint-compiler' 'meson')
checkdepends=('appstream-glib')
_commit=032e0762f0cb3d2e1bf09d27af18999c71d40d56 # tags/1.0.2^0
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson $pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
