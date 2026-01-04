# Maintainer: Simon <simon at gamersi dot at>
pkgname=lrcget-bin
pkgver=1.0.2
pkgrel=1
options=(!debug)
pkgdesc="Utility for mass-downloading LRC synced lyrics for your offline music library."
arch=('x86_64')
url="https://github.com/tranxuanthang/lrcget"
license=('MIT')
provides=('lrcget')
conflicts=('lrcget')
depends=('gtk3' 'webkit2gtk-4.1' 'pipewire-alsa')
source=("${pkgname}-${pkgver}.deb::https://github.com/tranxuanthang/lrcget/releases/download/${pkgver}/LRCGET_${pkgver}_amd64.deb")
b2sums=('SKIP')

package() {
  tar -xz -f data.tar.gz -C "$pkgdir"
  # refer to https://github.com/tauri-apps/tauri/issues/9750
  sed -i 's|Exec=LRCGET|Exec=lrcget|' "$pkgdir"/usr/share/applications/LRCGET.desktop
  cat > "$pkgdir"/usr/bin/lrcget << 'EOF'
#!/bin/bash
WEBKIT_DISABLE_COMPOSITING_MODE=1 WEBKIT_DISABLE_DMABUF_RENDERER=1 LRCGET
EOF
  chmod +x "$pkgdir"/usr/bin/lrcget
}
