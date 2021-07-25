# Maintainer: Jimin Kim <developomp@gmail.com>

pkgname='krunker-appimage'
pkgver='2.1.3'
pkgrel=1

pkgdesc="A free Multiplayer Online Game. No Download needed."
arch=('x86_64')
license=('custom') # https://krunker.io/docs/terms.txt
url='https://krunker.io'

depends=()
makedepends=()

source=(
  'https://client2.krunker.io/setup.AppImage'
  'terms.txt'
  'krunker.desktop'
  'krunker.png'
  'krunker'
)

sha256sums=(
  'SKIP'
  'f1181c174d40d8f38117dc86a498df1db45ccd52ee0d0c3028be7a8c8b5560cc'
  'cafac937a32a6370527166f38cadc1c0ac3385584bbdc302266f8775696e6a47'
  '4f7e8553cb12050fb79fb735ee4f53bd77a661398273cf9335fc0f10ced97b39'
  '3226cb60d743aab6f1704d08ee9e581c526a91c6b44cd0162324f6e4c1e2b7e5'
)

_appimageFileName="krunker.AppImage"

prepare() {
  cd "$srcdir"
  mv "setup.AppImage" "$_appimageFileName"
  chmod +x "$_appimageFileName"
}

package() {
  # AppImage
  if [ ! -f "$pkgdir/opt/appimages/$pkgname/krunker.AppImage" ]; then
    mkdir -p "$pkgdir/opt/appimages/$pkgname"
    install -Dm755 "$srcdir/$_appimageFileName" "$pkgdir/opt/appimages/$pkgname/krunker.AppImage"
  fi
  
  # Wrapper script
  if [ ! -f "$pkgdir/usr/bin/krunker-appimage" ]; then
    mkdir -p "$pkgdir/usr/bin/"
    install -m755 "$srcdir/krunker" "$pkgdir/usr/bin/krunker-appimage"
  fi
  
  # Add .desktop file
  if [ ! -f "$pkgdir/usr/share/applications/krunker.desktop" ]; then
    mkdir -p "$pkgdir/usr/share/applications"
    install -m644 "$srcdir/krunker.desktop" "$pkgdir/usr/share/applications/krunker.desktop"
  fi

  # Application icon
  if [ ! -f "$pkgdir/usr/share/pixmaps/krunker.png" ]; then
    mkdir -p "$pkgdir/usr/share/pixmaps"
    install -m644 "$srcdir/krunker.png" "$pkgdir/usr/share/pixmaps/krunker.png"
  fi

  # License
  if [ ! -f "$pkgdir/usr/share/licenses/$pkgname/terms.txt" ]; then
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    install -m644 "$srcdir/terms.txt" "$pkgdir/usr/share/licenses/$pkgname/terms.txt"
  fi
}
