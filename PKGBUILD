# Maintainer: Simon <simon at gamersi dot at>
pkgname=lrcget-bin
pkgver=2.2.1
pkgrel=2
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
  install -d "$pkgdir"/usr/lib/lrcget
  mv "$pkgdir"/usr/bin/lrcget "$pkgdir"/usr/lib/lrcget/lrcget
  cat > "$pkgdir"/usr/bin/lrcget << 'EOF'
#!/bin/bash
WEBKIT_DISABLE_COMPOSITING_MODE=1 WEBKIT_DISABLE_DMABUF_RENDERER=1 exec /usr/lib/lrcget/lrcget "$@"
EOF
  chmod +x "$pkgdir"/usr/bin/lrcget
}
