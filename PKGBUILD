# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=oyasumi-bin
pkgver=0.7.3
pkgrel=1
_oyasumiver=25.6.12
pkgdesc="Oyasumi (VR Sleeping Utilities)"
arch=('x86_64')
url="https://github.com/sofoxe1/OyasumiVR"
license=('MIT')
source=(
  "$pkgname-$_oyasumiver-$pkgver.tar.gz::https://github.com/sofoxe1/OyasumiVR/releases/download/oyasumivr-v$_oyasumiver-linux-v$pkgver/oyasumi-linux.tar.zst"
  'oyasumivr.desktop'
  'oyasumivr@128x128.png'
)
sha256sums=(
  'f5c0de2d61420e154d6adb153e6b2ae4773b284b376d58cce54ce29f6db849b1'
  '55b55fa249b95fca609073c22780c5eb0c3ced1f45717e872817e947a3897045'
  '7925098c33d2ebb44f28ef96a3cc92590010acacbee4d6ea45f1af2b81a3ae2c'
)

prepare() {
  # Extract the source archive
  tar -xf "$srcdir/$pkgname-$_oyasumiver-$pkgver.tar.gz" -C "$srcdir"
}

package() {  
  # Install only the executable
  install -d "$pkgdir/usr/bin"
  install -m755 "$srcdir/Oyasumi/OyasumiVR" "$pkgdir/usr/bin/oyasumivr"
  install -m755 "$srcdir/Oyasumi/resources/sidecars/oyasumivr-overlay-sidecar" "$pkgdir/usr/bin/oyasumivr-overlay-sidecar"

  # Install resources in /usr/share/oyasumi
  install -d "$pkgdir/usr/share/oyasumi/"
  cp -r "$srcdir/Oyasumi/resources"/* "$pkgdir/usr/share/oyasumi/"

  # Install desktop entry
  install -Dm644 "$srcdir/oyasumivr.desktop" "$pkgdir/usr/share/applications/oyasumivr.desktop" 
  install -Dm644 "$srcdir/oyasumivr@128x128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/oyasumivr.png"
}
