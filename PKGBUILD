
pkgname=calibre-zen
pkgver=0.5.0
pkgrel=5
pkgdesc="Modernized Calibre ebook library manager"
arch=('x86_64')
url="https://github.com/purplecandy/calibre-zen"
license=('GPL3')
depends=('glibc')
options=('!strip')

_archive="calibre-zen-${pkgver}-linux-x86_64.txz"

source=(
  "${url}/releases/download/v${pkgver}/${_archive}"
)

sha256sums=('7a707f47f1462d3a77fc14df3a7e2a7bd858fe019c9deaa45dc3f582cbfe66a1')

package() {
  cd "$srcdir"

  install -d "$pkgdir/opt"
  tar -xJf "$_archive" -C "$pkgdir/opt"

  local root="$pkgdir/opt/calibre-zen"

  install -d "$pkgdir/usr/bin"
  ln -s /opt/calibre-zen/calibre-zen "$pkgdir/usr/bin/calibre-zen"

  install -d "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 "$root/resources/content-server/calibre.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/calibre-zen.png"
  install -d "$pkgdir/usr/share/applications"

  cat > "$pkgdir/usr/share/applications/calibre-zen.desktop" <<'EOF'
[Desktop Entry]
Name=Calibre Zen
Comment=Modern ebook library manager
Exec=/opt/calibre-zen/calibre-zen %U
Icon=calibre-zen
Terminal=false
Type=Application
Categories=Office;Literature;
StartupNotify=true
EOF
}
