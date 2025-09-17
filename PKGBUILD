# Maintainer: schnur[at]i2pmail.org

pkgname=nrc
pkgver=0.6.9beta13
pkgrel=1
pkgdesc="NoRiskClient Launcher – A Minecraft client from the YouTuber of the same name"
arch=('x86_64')
url="https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.6.9-beta.13/NoRiskClient-Linux.deb"
license=('GPL')
depends=('glibc' 'gtk3' 'webkit2gtk' 'xdg-utils')
makedepends=('dpkg')
options=()

source=('https://github.com/NoRiskClient/noriskclient-launcher/releases/download/v0.6.9-beta.9/NoRiskClient-Linux.deb')
sha256sums=('0671af3924f705db90a92d342f27da567fa02939f83a458b4d90f2c4ed4183ad')

prepare() {
  dpkg-deb -x "$srcdir/NoRiskClient-Linux.deb" "$srcdir/pkg"
  rm -rf "$srcdir/pkg/DEBIAN"
}

build() {
  return 0
}

package() {
  desktop_file="$srcdir/pkg/usr/share/applications/NoRisk Launcher.desktop"

  # Exec‑Zeile ersetzen wegen einem Bug
  sed -i 's|^Exec=.*|Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/bin/noriskclient-launcher-v3|' "$desktop_file"

  cp -r "$srcdir/pkg/usr/." "$pkgdir/usr/"

  ln -s "$pkgdir/usr/bin/noriskclient-launcher-v3" "$pkgdir/usr/bin/nrc"
}
