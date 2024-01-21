# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonplus
_app_id=com.vysp3r.ProtonPlus
pkgver=0.4.9
pkgrel=1
pkgdesc="A simple Wine and Proton-based compatiblity tools manager for GNOME"
arch=('x86_64')
url="https://github.com/Vysp3r/ProtonPlus"
license=('GPL-3.0-or-later')
depends=('json-glib' 'libadwaita' 'libarchive' 'libgee' 'libsoup3')
makedepends=('meson' 'vala')
checkdepends=('appstream-glib')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a986d6722c78901a3e1e55770939b20bed8bd9cc09c1772d476f92bdf779e677')

build() {
  arch-meson "ProtonPlus-$pkgver" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs || :
}

package() {
  meson install -C build --destdir "$pkgdir"

  ln -s "/usr/bin/${_app_id}" "$pkgdir/usr/bin/$pkgname"
}
