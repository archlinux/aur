pkgname=ps4-discord
pkgver=1.0.0
pkgrel=1
pkgdesc="PS4 Discord integration tool using Discord Rich Presence and FTP"
arch=('any')
url="https://github.com/Marhau-devoloper/PS4-Discord"
license=('GPL3')

depends=('python' 'python-requests' 'python-pypresence')
makedepends=('git')

source=("git+https://github.com/Marhau-devoloper/PS4-Discord.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/PS4-Discord"
  git rev-parse --short HEAD
}

package() {
  cd "$srcdir/PS4-Discord"

  install -dm755 "$pkgdir/usr/share/ps4-discord"
  cp -r . "$pkgdir/usr/share/ps4-discord/"

  install -dm755 "$pkgdir/usr/bin"

  cat > "$pkgdir/usr/bin/ps4-discord" << 'EOF'
#!/bin/bash
cd /usr/share/ps4-discord
exec python main.py "$@"
EOF

  chmod +x "$pkgdir/usr/bin/ps4-discord"
}