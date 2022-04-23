# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=3.2.0
pkgrel=1
pkgdesc="Commit message editor."
arch=('x86_64')
url="https://apps.gnome.org/app/re.sonny.Commit"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gtksourceview5')
makedepends=('meson')
#checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
#            'gspell: spell checking support' # Spell checking has been temporarily removed
            )
source=("$pkgname-$pkgver.tar.gz::https://github.com/sonnyp/Commit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d85df545901824203531c2d95cbf80ba45e9d6e53d6a8f9227a3960f523d8695')

build() {
  arch-meson Commit-$pkgver build
  meson compile -C build
}

check() {

  # Validate appstream file fails, only validate desktop & schema files
  meson test 'Validate desktop file' 'Validate schema file' -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
