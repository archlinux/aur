# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=snoop
pkgver=0.3
pkgrel=1
pkgdesc="Snoop through your files"
arch=('x86_64')
url="https://gitlab.gnome.org/philippun1/snoop"
license=('GPL-3.0-or-later')
depends=('gtksourceview5' 'libadwaita')
makedepends=('git' 'meson' 'vala')
checkdepends=('appstream-glib')
optdepends=('python-nautilus: Nautilus extension')
source=("git+https://gitlab.gnome.org/philippun1/snoop.git#tag=$pkgver")
sha256sums=('bf41b61839d4afea5d5567449e995659196b1d863f18402c067c3b62a0173d88')

prepare() {
  cd "$pkgname"

  # Revert 'only support flatpak version in nautilus extension'
  git revert -n 764c2e0a197ca94b478ddba6ac87dd1b5899b7ba
}

build() {
  arch-meson "$pkgname" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"
}
