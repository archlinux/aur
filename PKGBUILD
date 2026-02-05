# Maintainer: Mr.Zero88 <huesmann.mats+aur@gmail.com>

pkgname=oyasumi
pkgver=0.4.0
pkgrel=1
_oyasumiver=25.6.12
pkgdesc="Oyasumi (VR Sleeping Utilities)"
arch=('x86_64')
url="https://github.com/sofoxe1/OyasumiVR"
license=('MIT')
source=("$pkgname-$_oyasumiver-$pkgver.tar.gz::https://github.com/sofoxe1/OyasumiVR/releases/download/oyasumivr-v$_oyasumiver-linux-v$pkgver/oyasumi-linux-alpha.4.tar.gz")
sha256sums=('d9f606d34e94cf07dd0352bc40bfa9a38d178e3744dc594233dfaabd294e23e3')

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
  install -d "$pkgdir/usr/share/oyasumi/sounds/"
  cp -r "$srcdir/Oyasumi/resources/sounds"/* "$pkgdir/usr/share/oyasumi/sounds/"
  install -d "$pkgdir/usr/share/oyasumi/ui/"
  cp -r "$srcdir/Oyasumi/resources/sidecars/ui"/* "$pkgdir/usr/share/oyasumi/ui/"
}
