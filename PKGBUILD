# Maintainer: Josef Vybíhal (josef.vybihal@gmail.com)
# Dependencies come from PKGBUILD by ftonello
# This package installs into /opt and symlinks to /usr

pkgname=t7-daw
pkgver=7.2.1
pkgrel=4
pkgdesc="The world's best, fully featured, completely unlimited free daw for all music creators."
arch=('x86_64')
url="https://www.tracktion.com/products/t7-daw"
#license=('custom:xx')
depends=(
  'alsa-lib' 'libgl' 'desktop-file-utils' 'shared-mime-info' 'curl' 'libx11'
  'libxext' 'libxinerama' 'freetype2' 'libcurl-gnutls')
optdepends=(
  'jack: A low-latency audio server'
  'ladspa-plugins: A set of ladspa plugins'
)
provides=("t7-daw=${pkgver}" "tracktion-7=${pkgver}")
options=('!emptydirs' '!strip')
install=${pkgname}.install
replaces=("tracktion-7-free-daw")
source=("TracktionInstall_7_Linux_64Bit_latest.deb::https://cdn.tracktion.com/file/tracktiondownload/t7/TracktionInstall_7_Linux_64Bit_latest.deb")
sha256sums=('904b120c2d597a2f504854a3a61883ca2b1f1066fb921aca423fdb42976d8db0')

package() {
  msg2 "Extracting the data.tar.lzma"
  mkdir -p ${pkgdir}/opt/${pkgname}
  tar -x --lzma -f data.tar.lzma -C "${pkgdir}/opt/${pkgname}/"
  
  cd "$pkgdir"
  install -dm0755 opt/$pkgname usr/bin usr/share/applications/ usr/share/doc usr/share/mime/packages usr/share/pixmaps

  ln -sf /opt/$pkgname/usr/bin/Tracktion7 usr/bin/Tracktion7
  ln -sf /opt/$pkgname/usr/bin/Tracktion7 usr/bin/tracktion7
  ln -sf /opt/$pkgname/usr/share/applications/tracktion7.desktop usr/share/applications/tracktion7.desktop
  ln -sf /opt/$pkgname/usr/share/doc/tracktion7 usr/share/doc/tracktion7
  ln -sf /opt/$pkgname/usr/share/mime/packages/tracktion7.xml usr/share/mime/packages/tracktion7.xml
  ln -sf /opt/$pkgname/usr/share/pixmaps/tracktion7.png usr/share/pixmaps/tracktion7.png
}
