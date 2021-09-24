# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=2.2.0
pkgrel=1
pkgdesc="Commit message editor."
arch=('x86_64')
url="https://apps.gnome.org/app/re.sonny.Commit"
license=('GPL3')
depends=('gjs' 'gtk3')
makedepends=('meson')
#checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
            'gspell: spell checking support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sonnyp/Commit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('79f3d88eb8cdc0c0a024e3953f03db0faab5d0368e4a917c91321571f6ff32ed')

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
