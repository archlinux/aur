# Maintainer: sfs <sfslinux@gmail.com>

pkgname=dunst-settings-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Standalone GTK3 settings editor for dunst"
arch=('x86_64')
url="https://github.com/sfs-pra/dunst-settings"
license=('MIT')
depends=('gtk3' 'glib2' 'dunst' 'libnotify')
makedepends=('pkgconf' 'gettext' 'git')
source=("git+https://github.com/sfs-pra/dunst-settings.git#tag=v${pkgver}")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/dunst-settings"
  git describe --tags | sed 's/^v//'
}

build() {
  cd "$srcdir/dunst-settings"
  make
}

package() {
  cd "$srcdir/dunst-settings"
  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}