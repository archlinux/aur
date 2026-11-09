
# Maintainer: Dylan Harkleroad <deehark87@gmail.com>

pkgname=gt3-revisited-bin
pkgver=0.6.3
pkgrel=1
pkgdesc="Open reimplementation of the Gran Turismo 3 A-Spec engine"
arch=('x86_64')
url="https://github.com/matt-pulsipher/GT3-revisited"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib')
optdepends=(
  'vulkan-icd-loader: Vulkan renderer support'
  'mesa: OpenGL ES and Mesa Vulkan drivers'
)
provides=('gt3-revisited')
conflicts=('gt3-revisited')
source=("$url/releases/download/v${pkgver}/gt3r-linux-$CARCH.tar.gz" "gt3r.png::https://raw.githubusercontent.com/sxdot/GT3-revisited/master/gt3r.png")
sha256sums=('da951aa4c5969d867668a499643e278d972309d4bc770125641f57600918e2ef'
            '60736ba89a11a51688e010119ad6b87d59732cadb041da28e7424b96168f3bfa')

package() {
  cd "$srcdir/gt3r-v${pkgver}-linux-$CARCH"

  # Main executables
  install -Dm755 bin/gt3r \
    "$pkgdir/opt/gt3-revisited/bin/gt3r"

  install -Dm755 bin/gt3tool \
    "$pkgdir/opt/gt3-revisited/bin/gt3tool"

  # Command-line launchers
  install -d "$pkgdir/usr/bin"

  ln -s /opt/gt3-revisited/bin/gt3r \
    "$pkgdir/usr/bin/gt3r"

  ln -s /opt/gt3-revisited/bin/gt3tool \
    "$pkgdir/usr/bin/gt3tool"

  # Desktop entry
  install -Dm644 share/applications/gt3r.desktop \
    "$pkgdir/usr/share/applications/gt3r.desktop"

  # Application icon
  install -Dm644 "$srcdir/gt3r.png" \
  "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/gt3r.png"

  # Documentation
  install -Dm644 share/doc/gt3r/README.md \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 share/doc/gt3r/THIRD-PARTY-NOTICES.md \
    "$pkgdir/usr/share/doc/$pkgname/THIRD-PARTY-NOTICES.md"

  install -Dm644 share/doc/gt3r/Barlow-OFL.txt \
    "$pkgdir/usr/share/doc/$pkgname/Barlow-OFL.txt"

  # License
  install -Dm644 share/doc/gt3r/LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
