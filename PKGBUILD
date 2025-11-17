# Maintainer: taotieren <admin@taotieren.com>

pkgname=rkdeveloptool-gui
pkgver=1.0.0
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
    python-pyqt6
    nuitka
)
optdepends=(
)
backup=()
options=('!strip' '!debug' '!lto')
install=
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha256sums=('87f2433138ef98ef578cc3de5e57f42ecc8fa06f6919e1ea94aa2aa669aa356a')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    # python build_nuitka.py
    python -m nuitka --standalone --onefile --follow-imports \
       --enable-plugin=pyqt6 \
       --include-data-file=./i18n.py=i18n.py \
      --output-filename=rkdeveloptool-gui \
       --output-dir=dist \
       rkdevtoolgui.py
       # --linux-onefile-icon=./images/icon.png \
}

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm755 "dist/${pkgname}" -t  "${pkgdir}/usr/bin/"
    # install -vDm644 "${pkgdir}/usr/share/applications/${pkgname}.desktop"
   #  install -vDm644  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
