# Maintainer: Dråfølin <derg at drafolin dot ch>

pkgname=tonearm

pkgver=1.0.1
pkgrel=1

pkgdesc="Unofficial native GTK4 / Adwaita music streaming client for TIDAL"
arch=("x86_64")
url="https://codeberg.org/dergs/Tonearm"
license=("GPL-3.0-or-later")

depends=(gtk4 gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad libadwaita libsecret)
makedepends=(git go)
provides=("${pkgname}=${pkgver}")

source=("${pkgname}::https://codeberg.org/dergs/Tonearm/archive/v${pkgver}.tar.gz")
sha256sums=('5fc3f2ae3b6d2fc2aad5cd9c48c4e7621517b10c6d4417eb4c83a6f3e21f6983')

build() {
    cd "$srcdir/${pkgname}"
    go build -ldflags="-X codeberg.org/dergs/tonearm/internal/ui.Version=${pkgver}" ./cmd/tonearm
}

package() {
    cd "$srcdir/${pkgname}"
    install -Dm0755 "tonearm" "$pkgdir/usr/bin/${pkgname}"
    install -Dm0644 "internal/icons/hicolor/128x128/apps/dev.dergs.Tonearm.png" -t "$pkgdir/usr/share/icons/hicolor/128x128/apps"
    install -Dm0644 "internal/icons/hicolor/scalable/apps/dev.dergs.Tonearm.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm0644 "internal/icons/hicolor/symbolic/apps/dev.dergs.Tonearm-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps"
    install -Dm0644 "internal/settings/dev.dergs.Tonearm.gschema.xml" -t "$pkgdir/usr/share/glib-2.0/schemas"
    install -Dm0644 "build/dev.dergs.Tonearm.desktop" -t "$pkgdir/usr/share/applications"
}
