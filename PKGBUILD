# Maintainer: taotieren <admin@taotieren.com>

pkgname=rkdeveloptool-gui
pkgver=5.7.0
pkgrel=1
pkgdesc="RKDevelopTool GUI is a graphical front-end for Rockchip's official rkdeveloptool"
arch=(any)
url="https://github.com/gahingwoo/RKDevelopTool-GUI"
license=('GPL-3.0-only')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=()
depends=(
    hicolor-icon-theme
    pyside6
    python
    # AUR
    rkdeveloptool
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
optdepends=(
)
backup=()
install=
source=(
    "${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('a3532e4f783278d5644ed8ff1697c2c8cd58e7444fde8b80a12f52984794505f')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

build() {
    cd "${srcdir}/${pkgname}/"
    python -m build --wheel --no-isolation
}

# check() {
#     cd "${srcdir}/${pkgname}/"
# }

package() {
    cd "${srcdir}/${pkgname}/"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -vDm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -vDm644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
    install -vDm644 packaging/*.desktop -t "${pkgdir}/usr/share/applications/"
    install -vDm644 packaging/*.appdata.xml -t "${pkgdir}/usr/share/metainfo/"
    install -vDm644 packaging/icon/*.svg -t "${pkgdir}//usr/share/icons/hicolor/scalable/apps/"
}
