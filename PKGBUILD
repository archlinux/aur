# Maintainer: Ali Safamanesh <daradege@proton.me>
pkgname=zic-player
pkgver=1.0.1
pkgrel=1
pkgdesc="A fast and lightweight TUI music player written in python"
arch=('any')
url="https://github.com/daradege/zic"
license=('MIT')
depends=(
    'python-pygame'
    'python-pydub'
    'python-textual'
    'ffmpeg'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/daradege/zic/archive/refs/heads/main.tar.gz")  # استفاده از main branch
sha256sums=('SKIP')

package() {
  cd "$srcdir/zic-main"
  
  python setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  
  install -Dm644 "zic.desktop" \
    "$pkgdir/usr/share/applications/zic-player.desktop"
  
  install -Dm644 "zic.png" \
    "$pkgdir/usr/share/pixmaps/zic-player.png"
  
  install -d "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/zic-player" << 'EOF'
#!/bin/sh
exec python -m zic.player "$@"
EOF
  chmod +x "$pkgdir/usr/bin/zic-player"
}