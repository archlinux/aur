# Maintainer: nanpuyue <nanpuyue@gmail.com>

pkgname=devdocs-desktop-bin
pkgver=0.7.1
_debfile=DevDocs_${pkgver}_amd64.deb
pkgrel=2
pkgdesc="A full-featured desktop app for DevDocs.io."
arch=('x86_64')
url="https://devdocs.egoist.sh/"
license=('MIT')
depends=('alsa-lib' 'gconf' 'gtk2' 'libxss' 'libxtst' 'nss')
makedepends=('imagemagick')
source=("$_debfile::https://github.com/egoist/devdocs-desktop/releases/download/v$pkgver/$_debfile")
sha256sums=('77bb24c322e520bbc6b58a74b0e788678394f52ff6a9672471befcf57b0f0716')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  cd "$pkgdir/usr/share/icons/hicolor/" 
  for size in 16 32 64 128 512; do
    mkdir -p ${size}x${size}/apps
    convert -resize ${size}x${size} 0x0/apps/devdocs.png ${size}x${size}/apps/devdocs.png
  done
  rm -rf 0x0
}

