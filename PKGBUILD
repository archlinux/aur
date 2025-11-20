


# Maintainer: taotieren <admin@taotieren.com>

pkgname=rkdeveloptool-gui
pkgver=2.0.0
pkgrel=1
pkgdesc="RKDevelopTool GUI is a graphical front-end for Rockchip's official rkdeveloptool"
arch=($CARCH)
url="https://github.com/gahingwoo/RKDevelopTool-GUI"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    glibc
    hicolor-icon-theme
    # AUR
    rkdeveloptool
)
makedepends=(
    git
    pyside6
    nuitka
)
optdepends=(
)
backup=()
options=('!strip' '!debug' '!lto')
install=
source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.png"
)
sha256sums=('7bfb962eb94fe6ab4dde53e63d43f3c0481937d5f7f4641bc072d5c80ad0a316'
            '91619e46e6adff808ed8a3061be5226589ed07ddf9ecd8df33e1a99f5ac563c4')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
       cd "${srcdir}/${pkgname}/"
        python build_nuitka.py
 }

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm755 "${pkgname}" -t "${pkgdir}/usr/bin/"
    install -vDm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=${pkgname}
Comment=${pkgdesc}
GenericName=${pkgdesc}
Exec=${pkgname}
StartupNotify=false
Terminal=false
Type=Application
Categories=Utility;
Icon=${pkgname}.png
EOF
    install -vDm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
