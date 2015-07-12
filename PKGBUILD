# Maintainer : GI_Jack <iamjacksemail@hackermail.com>
# Contributer: Kniyl   <mathias@mettinger.fr>

pkgname=touchegg-gce-git
_pkgname=touchegg-gce
pkgver=1.1
pkgrel=3
pkgdesc="GUI for touchegg"
arch=('i686' 'x86_64')
url="https://github.com/Raffarti/Touchegg-gce"
license=('CC-BY')
depends=('qt4' 'libx11' 'touchegg')
makedepends=('libx11' 'git' )
source=("git://github.com/Raffarti/Touchegg-gce.git" "touchegg-gce.desktop" "touchegg.patch")
sha256sums=('SKIP'
            'abd417b6895f6a52455285b06dd3090f0fdf00bcec3f28bcf186a28b2db9db43'
            '49d25c678abfb81407c10e659df55f188c79dbe5808d314cac094be67fcdfa3c')
 
build() {
  [[ -d "${srcdir}/Touchegg-build" ]] && rm -rf "${srcdir}/Touchegg-build"
  cp -r "${srcdir}/Touchegg-gce" "${srcdir}/Touchegg-build"
  cd "${srcdir}/Touchegg-build"
  patch -i "${srcdir}/touchegg.patch"
  qmake-qt4
  make
}
 
package() {
  cd "${srcdir}/Touchegg-build"
  install -Dm755 touchegg-gce "${pkgdir}/usr/bin/touchegg-gce"
  install -Dm644 "${srcdir}/touchegg-gce.desktop" "${pkgdir}/usr/share/applications/touchegg-gce.desktop"
  install -d "${pkgdir}/usr/share/touchegg-gce/Dictionaries"
  cp Dictionaries/*.qm Dictionaries/*.ts "${pkgdir}/usr/share/touchegg-gce/Dictionaries"
}
