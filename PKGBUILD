# Maintainer: Debasish Patra <patradebasish1987@gmail.com>
pkgname=linuxthemestore-git
pkgver=1.0.1
pkgrel=1.0
pkgdesc="A Linux desktop app to install linux themes"
arch=('x86_64')
url="https://github.com/debasish-patra-1987/linuxthemestore"
license=('MIT')
provides=("linuxthemestore")
depends=('libadwaita' 'gtk4')
makedepends=('cargo' 'git' 'libadwaita' 'gtk4' 'meson' 'ninja' 'glib2')
conflicts=('linuxthemestore-bin')
source=("$pkgname::git+https://github.com/debasish-patra-1987/linuxthemestore")
sha1sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo update
  cargo fetch --manifest-path Cargo.toml --verbose
  cargo build --release --verbose
}
package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/linuxthemestore -t "$pkgdir/usr/bin/"
  install -Dm644 assets/io.github.debasish_patra_1987.linuxthemestore.metainfo.xml -t "$pkgdir/usr/share/metainfo"
  install -Dm644 assets/io.github.debasish_patra_1987.linuxthemestore.svg -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  mv assets/io.github.debasish_patra_1987.linuxthemestore.in assets/io.github.debasish_patra_1987.linuxthemestore.desktop
  desktop-file-install --dir="$pkgdir/usr/share/applications" assets/io.github.debasish_patra_1987.linuxthemestore.desktop
}

