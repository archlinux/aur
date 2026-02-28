# Maintainer: Shira Nguyen <sn3446409@gmail.com>

pkgname=qbit-manage-desktop-bin
_srcver="v4.6.5"
pkgver="${_srcver#v}"
pkgrel=2
pkgdesc="GUI application for qBit_manage, a program used to manage your qBittorrent instance."
arch=('x86_64')
url="https://github.com/StuffAnThings/qbit_manage/"
license=('MIT')
depends=(
  gtk3
  libayatana-appindicator
  webkit2gtk-4.1
)
makedepends=('imagemagick')
options=(!strip)
provides=('qbit-manage-desktop' 'qbit-manage')
conflicts=('qbit-manage-desktop')
source=("${pkgname}-${pkgver}.deb::${url}releases/download/${_srcver}/qBit.Manage_${pkgver}_amd64-desktop-installer.deb"
        "https://raw.githubusercontent.com/StuffAnThings/qbit_manage/xenia-edge/${_srcver}/LICENSE")
sha256sums=('0b79bc23f7831394e8c19f6b8d69e929dfdd3d71b17ea5dac6fabc2551c612df'
            'SKIP')

prepare() {
    bsdtar -xf "${srcdir}/data.tar."*

    mkdir -p "${srcdir}/usr/share/icons/hicolor/512x512/apps"

    magick \
      "${srcdir}/usr/share/icons/hicolor/4096x4097/apps/qbit-manage-desktop.png" -resize 512x512 \
      "${srcdir}/usr/share/icons/hicolor/512x512/apps/qbit-manage-desktop.png"

    rm -r "${srcdir}/usr/share/icons/hicolor/4096x4097"
}

package() {
    cp -r --preserve=mode,timestamps "${srcdir}/usr" "${pkgdir}/"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}




