# I used the .deb instead because the AppImage was failing with errors like FUSE issues, squashfs errors, and not mounting. It looks like the AppImage release might be incorrectly packaged or incompatible.

# Build DB Toolkit from .deb release;
pkgname=db-toolkit
pkgver=0.1.0_beta7
pkgrel=2
pkgdesc="Deprecated. Use db-toolkit-bin instead"
arch=('x86_64')
url="https://github.com/db-toolkit/db-toolkit"
license=('MIT')
depends=()
options=('!strip') # Remove those debug warnings

source=(
  "https://github.com/db-toolkit/db-toolkit/releases/download/v0.1.0-beta7/DB.Toolkit-linux.deb"
)

sha256sums=('86b7c08a44ce5c1818b986a5dac651abfed9b73c234958697346839b1580da35')

package() {
  cd "$srcdir"

  ar x DB.Toolkit-linux.deb
  tar -xf data.tar.*

  cp -r opt "$pkgdir/"
  cp -r usr "$pkgdir/"

  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/db-toolkit" << 'EOF'

#!/bin/bash
exec "/opt/DB Toolkit/db-toolkit" "$@"
EOF

  chmod +x "$pkgdir/usr/bin/db-toolkit"
}
