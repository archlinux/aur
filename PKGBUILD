# Maintainer: shafrnv <shafrnv@localhost>
pkgname=raskadrovka
pkgver=0.1.0
pkgrel=1
pkgdesc="Native UI for video storyboards and scan-to-video contact sheets"
arch=('any')
url="https://aur.archlinux.org/packages/raskadrovka"
license=('MIT')
depends=(
  'python'
  'python-pyqt6'
  'python-opencv'
  'python-numpy'
  'python-pillow'
  'python-scipy'
  'python-imageio'
  'python-pymupdf'
  'qt6-multimedia'
  'ffmpeg'
)
source=(
  'app.py'
  'pipeline.py'
  'raskadrovka.py'
  'extract_frames.py'
  'scan_to_video.py'
  'raskadrovka.desktop'
  'LICENSE'
)
sha256sums=(
  'cb58ff5ff7f62557d132f2782aa8562daf6e7dc5d1a21e20de1c1ce228811a0c'
  'ac2a4192f9226a672b3fb683b1f8e617509859ab9e78f6b35ffab87744f1edf3'
  '9a1fa4b475cc0beb2c17d8a77b29ad4426f7752d8aab2afd9f370ec1c4872b05'
  'bd9fdbbf7953d2923fede0e7bad6d490d53b6a8d5f21eb98d59298421f82fda9'
  'a45819e07ee756fb33bdc7be2b88b81ed0de66dea202b3c8915d2887b4a7137e'
  'a36733f4fcb7085904bb60549585587508be75c5d9b97b46b14e8c78b7b28b13'
  'ae01b7de127e73a13f15d93dfd2aeebf30c9357566362c8d7edf83b9735f52f9'
)

package() {
  local libdir="$pkgdir/usr/lib/$pkgname"
  install -d "$libdir"
  install -Dm644 app.py pipeline.py raskadrovka.py extract_frames.py scan_to_video.py \
    -t "$libdir"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/raskadrovka" <<'EOF'
#!/bin/sh
exec /usr/bin/python /usr/lib/raskadrovka/app.py "$@"
EOF

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/raskadrovka-cli" <<'EOF'
#!/bin/sh
exec /usr/bin/python /usr/lib/raskadrovka/raskadrovka.py "$@"
EOF

  install -Dm644 raskadrovka.desktop \
    "$pkgdir/usr/share/applications/raskadrovka.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
