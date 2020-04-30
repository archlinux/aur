# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=tweakstyle
pkgver=0.9.5
pkgrel=1
pkgdesc="TweakStyle is an Integrated Development Environment for Web Development"
arch=('x86_64')
url="https://tweakstyle.com"
license=('custom')
depends=('pango-legacy')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://tweakstyle.com/dl/TweakStyle-linux64-${pkgver}.tar.gz")
sha256sums=('acdf36b8f613564efd1c99029bee7e9221cad945a95a57ee83c53e2381c9e30f')

package() {
  install -Dm644 "${srcdir}/TweakStyle/tweakstyle.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/TweakStyle/tweakstyle.png" -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 "${srcdir}/TweakStyle/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  mkdir -p "${pkgdir}/opt"
  mv "${srcdir}/TweakStyle" "${pkgdir}/opt/tweakstyle"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mv "${pkgdir}/opt/tweakstyle/samples" "${pkgdir}/usr/share/${pkgname}"
  echo "#!/usr/bin/env bash
  LD_LIBRARY_PATH=/opt/pango-legacy/usr/lib /opt/tweakstyle/TweakStyle" > tweakstyle.sh
  chmod 755 tweakstyle.sh
  mv tweakstyle.sh "${pkgdir}/usr/bin/tweakstyle"
  sed -i '6s|.*|Exec=tweakstyle|' "${pkgdir}/usr/share/applications/tweakstyle.desktop"
  rm "${pkgdir}/opt/tweakstyle/tweakstyle.desktop"
  rm "${pkgdir}/opt/tweakstyle/tweakstyle.png"
  rm "${pkgdir}/opt/tweakstyle/LICENSE"
}