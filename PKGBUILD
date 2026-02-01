# Maintainer: Taygun86

pkgname=zapret-gtk
pkgver=0.3.0
pkgrel=1
pkgdesc="GUI client for Zapret DPI Bypass"
arch=('x86_64')
url="https://github.com/Taygun86/zapret-gtk"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'iptables' 'ipset' 'curl' 'git' 'polkit')
makedepends=('cargo')
source=("git+$url.git#tag=v$pkgver") # Bu satır release tag'i atıldığında çalışır
# Geliştirme aşamasında lokal dosya için source dizisi boş bırakılabilir veya değiştirilebilir.
md5sums=('SKIP')

build() {
  cd "$pkgname"
  cargo build --release --locked
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/zapret-gtk "$pkgdir/usr/bin/zapret-gtk"
  install -Dm644 zapretgtk512.png "$pkgdir/usr/share/icons/hicolor/512x512/apps/zapret-gtk.png"
  install -Dm644 zapret-gtk.desktop "$pkgdir/usr/share/applications/zapret-gtk.desktop"
}
