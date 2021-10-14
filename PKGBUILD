# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=3.0.0
pkgrel=1
pkgdesc="Commit message editor."
arch=('x86_64')
url="https://apps.gnome.org/app/re.sonny.Commit"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gtk4')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
#            'gspell: spell checking support' # Spell checking currently disabled
            )
source=("$pkgname-$pkgver.tar.gz::https://github.com/sonnyp/Commit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6821a2dd3b422f27c42b0119b9fc96b588cfd6a87111f9d5b8e4ac3556dbf136')

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
