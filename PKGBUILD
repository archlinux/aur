pkgname=slicepdf-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="slicePDF | lightweight document manipulation tool (AppImage)"
arch=("x86_64")
url="https://slicepdf.vercel.app"
license=("MIT")
depends=("fuse2")
options=(!strip)
provides=("slicepdf")
source=("slicePDF.AppImage::https://github.com/soamn/slicePDF/releases/latest/download/slicePDF.AppImage")
sha256sums=("SKIP")

package() {
  install -Dm755 "$srcdir/slicePDF.AppImage" \
    "$pkgdir/opt/slicepdf/slicepdf.AppImage"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/slicepdf" << 'EOF'
#!/bin/bash
export GDK_BACKEND=x11
export WEBKIT_DISABLE_DMABUF_RENDERER=1
exec /opt/slicepdf/slicepdf.AppImage "$@"
EOF
}
