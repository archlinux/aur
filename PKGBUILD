pkgname=feishin-bin
pkgver=1.13.0
pkgrel=1
pkgdesc="Modern web-based music player (prebuilt binary)"
arch=('x86_64')
url="https://github.com/jeffvli/feishin"
license=('GPL3')

depends=('libnotify' 'nss' 'gtk3' 'alsa-lib')

provides=('feishin')
conflicts=('feishin')

source=(
  "feishin.tar.xz::https://github.com/jeffvli/feishin/releases/download/v${pkgver}/Feishin-linux-x64.tar.xz"
)

noextract=("feishin.tar.xz")
sha256sums=('SKIP')

package() {
  mkdir -p "$pkgdir/opt/feishin"
  mkdir -p "$pkgdir/usr/bin"

  bsdtar -xf feishin.tar.xz -C "$pkgdir/opt/feishin"

  cat > "$pkgdir/usr/bin/feishin" << 'EOF'
#!/bin/bash
exec /opt/feishin/feishin "$@"
EOF

  chmod +x "$pkgdir/usr/bin/feishin"

  # cleanup
  find "$pkgdir" -name ".PKGINFO" -delete
  find "$pkgdir" -name ".BUILDINFO" -delete
  find "$pkgdir" -name ".MTREE" -delete
}
