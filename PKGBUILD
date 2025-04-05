# Maintainer: Nikos Toutountzoglou <nikos.toutou@protonmail.com>

pkgname=ttf-publik
pkgver=1.001
pkgrel=1
pkgdesc='Publik sans-serif TrueType font family by Essen International'
arch=('any')
url='https://fonnts.com/publik/'
license=('LicenseRef-custom')
source=("$pkgname-$pkgver.zip::https://fonnts.com/downloads/fonnts.com-460467.zip")
sha256sums=('9195d71dff869f26289f192538f7e30366a701ca93925b08a997bf3616f125e5')
b2sums=('f05ea547ac02353df29037e416f2bafb1aedb0e0f923c50b6a7f9ff7bd2899817778f4ad94cbccd378c77f6000fe6e43e9b9e13d2e55079798fba0e10b72ddb0')

package() {
  # Create font directory
  install -dm755 "$pkgdir/usr/share/fonts/TTF"
  
  # Install font files with renamed filenames (removing the "fonnts.com-" prefix)
  for fontfile in "$srcdir"/fonts/fonnts.com-*.ttf; do
    newfont=$(basename "$fontfile" | sed 's/fonnts\.com-//')
    install -m644 "$fontfile" "$pkgdir/usr/share/fonts/TTF/$newfont"
  done
  
  # Create license file
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  cat > "$pkgdir/usr/share/licenses/$pkgname/LICENSE" << EOF
Publik Font Family by Essen International
Free for personal use

Family name: Publik
Designer: Essen International
Manufacturer: Essen International
Vendor URL: www.esseninternational.com
Version: 1.001
Published Date: 2024-08-12
EOF
}
