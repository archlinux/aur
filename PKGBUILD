# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=3.1.0
pkgrel=1
pkgdesc="Commit message editor."
arch=('x86_64')
url="https://apps.gnome.org/app/re.sonny.Commit"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gtk4')
makedepends=('meson')
#checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
#            'gspell: spell checking support' # Spell checking has been temporarily removed
            )
source=("$pkgname-$pkgver.tar.gz::https://github.com/sonnyp/Commit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('09070c74b103faaf5b43119d910a3b4b911ec8f27f0924be7bd28c6f7d19f5be')

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
