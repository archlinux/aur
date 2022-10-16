# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=junction
_pkgname=Junction
pkgver=1.6
_commit=c9da76cae9f8e26957266a4171e7e0212dc63ef5
pkgrel=1
pkgdesc="Application/browser chooser"
arch=('x86_64')
url="https://github.com/sonnyp/Junction"
license=('GPL3')
depends=('libadwaita' 'libportal-gtk4' 'gjs')
makedepends=('git' 'meson' 'blueprint-compiler')
checkdepends=('appstream-glib')
source=("${pkgname}-${pkgver}::git+$url#commit=$_commit"
  'git+https://github.com/sonnyp/troll.git')
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd "$pkgname-$pkgver"
  git submodule init
  git config submodule.src/troll.url "$srcdir/troll"
  git submodule update --init --recursive
}

build() {
  arch-meson "$pkgname-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
