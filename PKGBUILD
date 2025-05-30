# Maintainer: Tom Brown <tom@CarlsonSpeed.com>
pkgname='aurkit'
pkgver=0.1.0
pkgrel=1
pkgdesc="This is what the package does"
arch=('any')
url="https://github.com/TomB19/$pkgname"
license=('MIT')
depends=('bash')  # Replace with actual runtime dependencies
makedepends=('git')
source=("git+https://github.com/TomB16/$pkgname.git#branch=master")
sha256sums=('SKIP')

# Uncomment and modify if you want automatic versioning from git tags
# pkgver() {
#   cd "$srcdir/$pkgname"
#   git describe --tags --always | sed 's/^v//;s/-/./g'
# }

package() {
  cd "$srcdir" || return 1

  # Install scripts
  install -Dm755 "$srcdir/aurkit-template/src/script1" "$pkgdir/usr/bin/script1"
  install -Dm755 "$srcdir/aurkit-template/src/script2" "$pkgdir/usr/bin/script2"
  # Add more scripts as needed

  # Install .desktop file(s) for KDE service menus (optional)
  install -Dm644 "$srcdir/aurkit-template/aurkit.desktop" "$pkgdir/usr/share/kio/servicemenus/aurkit.desktop"

  # Install optional config file
  install -Dm644 "$srcdir/aurkit-template/aurkit.conf" "$pkgdir/usr/share/aurkit/aurkit.conf"

  # License
  install -Dm644 "$srcdir/aurkit-template/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # KDE service cache rebuild (optional but useful for context menu updates)
  if command -v kbuildsycoca5 &> /dev/null; then kbuildsycoca5; fi
  if command -v kbuildsycoca6 &> /dev/null; then kbuildsycoca6; fi
}
