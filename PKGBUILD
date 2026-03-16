# Maintainer: Himalian <Himalian9227@proton.me>
pkgname=biopass-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Biometric Authentication System"
arch=('x86_64')
url="https://github.com/TickLabVN/biopass"
license=('MIT')
depends=('opencv' 'yaml-cpp' 'fprintd' 'webkit2gtk-4.1' 'gtk3' 'hicolor-icon-theme')
provides=('biopass')
conflicts=('biopass')
source=("biopass_${pkgver}_amd64.deb::https://github.com/TickLabVN/biopass/releases/download/${pkgver}/biopass_${pkgver}_amd64.deb")
sha256sums=('62ec61518269e928019b12dcea64c36ab6a664c3672ff356b86170eade8051fc')
options=(!strip !debug)

prepare() {
  # Extract data.tar.gz from the debian package
  ar x "biopass_${pkgver}_amd64.deb" data.tar.gz
  tar -xzf data.tar.gz
}

package() {
  # Move files from /usr/local to /usr if they exist
  if [ -d usr/local ]; then
    cp -a usr/local/* usr/
    rm -rf usr/local
  fi
  
  cp -a usr "${pkgdir}/"
}
