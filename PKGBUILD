# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=commit
pkgver=3.3.0
pkgrel=1
pkgdesc="Commit message editor."
arch=('x86_64')
url="https://apps.gnome.org/app/re.sonny.Commit"
license=('GPL3')
depends=('libadwaita' 'gjs' 'gtksourceview5')
makedepends=('meson')
checkdepends=('appstream-glib')
optdepends=('git: git support'
            'mercurial: mercurial support'
#            'gspell: spell checking support' # Spell checking has been temporarily removed
            )
source=("$pkgname-$pkgver.tar.gz::https://github.com/sonnyp/Commit/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b993a2786b022b748959ba096fdf9248ab02ca52b400295484e0646e8ff220a4')

build() {
  arch-meson Commit-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
