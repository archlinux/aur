# Maintainer: taotieren <admin@taotieren.com>

pkgname=rkdeveloptool-gui
pkgver=5.0.3
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
    python-dbus 
    # AUR
    rkdeveloptool
)
makedepends=(
    git
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
    "${pkgname}::git+${url}.git#tag=${pkgver}"
    "${pkgname}.png"
)
sha256sums=('7a087a5516db47aab2c1fd522517bd852d2d139329086e1d09e51e70316325d9'
            '91619e46e6adff808ed8a3061be5226589ed07ddf9ecd8df33e1a99f5ac563c4')

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
    install -vDm644 packaging/rkdeveloptool-gui.desktop -t "${pkgdir}/usr/share/applications/"
    install -vDm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
}
