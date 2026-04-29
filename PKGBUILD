pkgname=ultrapaper
pkgver=0.1.2
pkgrel=1
pkgdesc="GTK4 GUI for hyprpaper (Hyprland wallpaper management)"
arch=('x86_64')
groups=('hyprland-ecosystem')
url="https://github.com/AhmedAlYousif/ultrapaper"
license=('MIT')
depends=('gtk4')
optdepends=('hyprland: provides hyprctl command (required)'
           'hyprpaper: wallpaper backend (required)')
makedepends=('rust' 'cargo' 'git' 'pkgconf' 'gobject-introspection' 'glib2' 'gtk4' 'cairo' 'pango' 'gdk-pixbuf2')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
		"ultrapaper.desktop")
sha256sums=('6630caaa0c25a1c3338a49a8ce7364c90e8641f4a5841b266867eb889a9e633e'
            'c3231c3690c1b509ee5b4cd1d83e1dc826ddd115e7b64130ba6cce8c1ffe83b9')
options=('!strip')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  cargo build --release --locked
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "target/release/ultrapaper" "${pkgdir}/usr/bin/ultrapaper"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ultrapaper.desktop" "${pkgdir}/usr/share/applications/ultrapaper.desktop"
}
