# Maintainer: JonasAlv
pkgname=zap-elec
pkgver=1.0.0
pkgrel=2
pkgdesc="Simple web wrapper for WhatsApp Web"
arch=('x86_64')
url="https://github.com/JonasAlv/zap-elec"
license=('MIT')
depends=('nss' 'alsa-lib' 'libxss' 'libxtst' 'xdg-utils' 'libnotify')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/v${pkgver}/zap-elec_${pkgver}_amd64.deb")
sha256sums_x86_64=('SKIP')

package() {
  cd "$srcdir"

  # Extract .deb file
  ar x "zap-elec_${pkgver}_amd64.deb"

  if [[ -f data.tar.xz ]]; then
    tar -xf data.tar.xz -C "$pkgdir"
  elif [[ -f data.tar.gz ]]; then
    tar -xf data.tar.gz -C "$pkgdir"
  else
    echo "No data.tar archive found!"
    return 1
  fi

  # make symlink
  mkdir -p "$pkgdir/usr/bin"
  ln -sf /opt/zap-elec/whatsapp "$pkgdir/usr/bin/zap-elec"
}
