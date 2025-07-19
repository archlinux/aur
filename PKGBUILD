# Maintainer: Swapnanil1 <swapnanil.chrome333@passinbox.com>

_basename=ab-download-manager
pkgname=${_basename}-bin
pkgver=1.6.6
pkgrel=2
pkgdesc="A Download Manager that speeds up your downloads"
arch=('x86_64')
url="https://abdownloadmanager.com/"
license=('Apache-2.0')
# Add the options array to disable debug package creation
options=('!debug')
provides=("${_basename}")
conflicts=("${_basename}")
depends=(
    'java-runtime'
    'libxrender'
    'libxtst'
    'harfbuzz'
    'fontconfig'
    'libappindicator-gtk3'
)
optdepends=()
source=(
    "https://github.com/amir1376/ab-download-manager/releases/download/v${pkgver}/ABDownloadManager_${pkgver}_linux_x64.tar.gz"
)
sha256sums=('76db9055bb1fc728bbb28a5fd2051730a47cb88753eb7b316e987aa8c5382bfa')

package() {
    install -d "${pkgdir}/opt/${_basename}"
    cd "${srcdir}/ABDownloadManager"
    cp -r ./* "${pkgdir}/opt/${_basename}/"
    install -Dm644 "${pkgdir}/opt/${_basename}/lib/ABDownloadManager.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/abdownloadmanager.png"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/abdownloadmanager.desktop" <<EOF
[Desktop Entry]
Name=AB Download Manager
Comment=A Download Manager that speeds up your downloads
Exec=/opt/${_basename}/bin/ABDownloadManager
Icon=abdownloadmanager
Terminal=false
Type=Application
Categories=Network;FileTransfer;
EOF
}
