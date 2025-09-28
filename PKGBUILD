# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>

_pkgname=kanri
pkgname=kanri-bin
pkgver=0.8.2
pkgrel=1
pkgdesc="Modern offline Kanban board app using tauri"
arch=('x86_64')
url="https://github.com/kanriapp/kanri"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('binutils')  # 'ar' is part of the binutils package
source=("${_pkgname}_${pkgver}.deb::https://github.com/kanriapp/kanri/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb" "kanri-wrapper.sh")
sha256sums=('f3de8628500e57275d34644b7994b4ec3a5dfa956b8468fe676fb6e6d0ba6f15'
            '02d85b8954fe86c43b1d3b5567ee7683238a5c766d0b3d59b7ba0d5812f37906')

prepare() {
    ar x "${srcdir}/${_pkgname}_${pkgver}.deb"
    tar xf data.tar.gz
}

package() {
    install -Dm755 "${srcdir}/kanri-wrapper.sh" "${pkgdir}/usr/bin/kanri"
    install -Dm755 "${srcdir}/usr/bin/kanri" "${pkgdir}/usr/lib/kanri"

    cp -r "${srcdir}/usr/share" "${pkgdir}/usr/share"
}

