# Maintainer: Mahdi Khosravi <mmk1776@gmail.com>
pkgname=koofr-desktop-bin
pkgver=41a82e7
pkgrel=1
pkgdesc="Koofr Desktop Client - Cloud storage client"
arch=('x86_64')
url="https://koofr.eu/"
depends=('gvfs')
license=('custom')
options=(!strip)
source=("koofr-${pkgver}-linux-x86_64.tar.gz::https://app.koofr.net/dl/apps/linux64"
        "koofr.desktop")
sha256sums=('fa34a74e31f3b6d145f300e547dd0d92bc6293634eb0a8b5f2442440a216bb1a'
            '9e59b2cb3d1fb8c678e0aa3b36919c679945207f01b65846c884f4de8fa43ed9')

prepare() {
  cd "${srcdir}"
  tar -xf "koofr-${pkgver}-linux-x86_64.tar.gz"
  cd "koofr"
  rm -f "Install.desktop" "installer.sh"
}

package() {
  install -Dm644 "${srcdir}/koofr.desktop" "${pkgdir}/usr/share/applications/koofr.desktop"

  cd "${srcdir}/koofr"

  install -dm755 "${pkgdir}/opt"
  cp -r . "${pkgdir}/opt/koofr"

  install -d "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
  ln -s "/opt/koofr/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/koofr.png"

  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/koofr/storagegui" "${pkgdir}/usr/bin/koofr"
}

