# Maintainer: Shira Nguyen <sn3446409@gmail.com>

pkgname=qbit-manage-desktop-bin
_srcver="v4.7.1"
pkgver="${_srcver#v}"
pkgrel=1
pkgdesc="GUI application for qBit_manage, a program used to manage your qBittorrent instance."
arch=('x86_64')
url="https://github.com/StuffAnThings/qbit_manage/"
license=('MIT')
depends=(
  gtk3
  libayatana-appindicator
  webkit2gtk-4.1
  hicolor-icon-theme
  libgcc
  gdk-pixbuf2
  cairo
  zlib-ng-compat
  glib2
  libsoup3
  glibc
)
makedepends=('imagemagick')
options=(!strip)
provides=('qbit-manage-desktop' 'qbit-manage')
conflicts=('qbit-manage-desktop')
source=("${pkgname}-${pkgver}.deb::${url}releases/download/${_srcver}/qBit.Manage_${pkgver}_amd64-desktop-installer.deb"
        "qbit-manage-license::https://raw.githubusercontent.com/StuffAnThings/qbit_manage/refs/heads/master/LICENSE")
sha256sums=('216894dfd4db991160eabcbef76db175411feabca5f538c2525a825058bbbc1a'
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

    install -Dm644 "${srcdir}/qbit-manage-license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}




