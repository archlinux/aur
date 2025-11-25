pkgname=ultrapaper
pkgver=0.0.1
pkgrel=1
pkgdesc="GTK4 GUI for hyprpaper (Hyprland wallpaper management)"
arch=('x86_64')
groups=('hyprland-ecosystem')
url="https://github.com/AhmedAlYousif/ultrapaper"
license=('MIT')
depends=('gtk4')
optdepends=('hyprland: provides hyprctl command (required)'
           'hyprpaper: wallpaper backend (required)')
makedepends=('go' 'git' 'pkgconf' 'gobject-introspection' 'glib2' 'gtk4' 'cairo' 'libsoup3' 'pango' 'gdk-pixbuf2')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
		"ultrapaper.desktop")
sha256sums=('17b8e97448cdea7a49b4628f4e2035fd3e3131bb9e1901c6a3a597e125e0a6f9'
			'c3231c3690c1b509ee5b4cd1d83e1dc826ddd115e7b64130ba6cce8c1ffe83b9')
options=('!strip')
build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export CGO_ENABLED=1
  go build -v -trimpath -ldflags="-s -w" -o ultrapaper
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "ultrapaper" "${pkgdir}/usr/bin/ultrapaper"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/ultrapaper.desktop" "${pkgdir}/usr/share/applications/ultrapaper.desktop"
}
