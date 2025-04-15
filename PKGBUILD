# Maintainer: Thomas Rijpstra <thomas at fourlights dot nl>

_pkgname=kanri
pkgname=kanri-bin
pkgver=0.8.1
pkgrel=1
pkgdesc="Modern offline Kanban board app using tauri"
arch=('x86_64')
url="https://github.com/kanriapp/kanri"
license=('GPL-3.0-or-later')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
makedepends=('binutils')  # 'ar' is part of the binutils package
source=("${_pkgname}_${pkgver}.deb::https://github.com/kanriapp/kanri/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb" "kanri-wrapper.sh")
sha256sums=('4cef42f227f2e90161bf19737f14b29d6d344bf8a2aa3636b33c39d5aa274597'
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

