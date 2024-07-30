# Maintainer : silverhikari
# Contributor: Ainola
# Contributor: Arch Linux Pro Audio
# Contributor: SpepS
# Contributor: Bernardo Barros

pkgname=csound-blue
pkgver=2.9.1
pkgrel=2
pkgdesc="A music composition environment for Csound"
arch=('i686' 'x86_64')
url="http://blue.kunstmusik.com/"
license=('GPL-2.0-or-later')
depends=('csound' 'java-environment>=7' 'java-openjfx')
makedepends=('pd' 'scons' 'swig' 'dssi' 'boost')
provides=('csound-blue')
conflicts=('csound-blue')
source=("https://github.com/kunstmusik/blue/releases/download/${pkgver}/blue-linux-${pkgver}.zip"
        "blue.desktop"
        "icons.tar.gz")
sha256sums=('0b36dee97570953fc1bb646a7ae80b920624fb3abf8c770ba955f57bf2844e64'
            '06dcc0dbade0b9c2eb904815aefa86d32e8e21de47fd7cd8873f139c1fb24fe6'
            '60240d02dd3f25b9df684efaf93a5fd05e520b5f46e94f24b58de60604dbae36')
options=(!strip)

package() {
  mkdir -p "$pkgdir"/opt/blue
  mkdir -p "$pkgdir"/usr/bin
  cp -r "$srcdir"/blue/* "$pkgdir"/opt/blue
  ln -s "/opt/blue/bin/blue" "$pkgdir/usr/bin/blue"

  install -D -m644 "${srcdir}/blue.desktop" "${pkgdir}/usr/share/applications/blue.desktop"
  for size in 16 22 24 32 48 64 128 256 512; do
      install -Dm644 "$srcdir/icons/${size}.png" \
        "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/blue.png"
  done
}
