# Author: William Franco Abdul Hai <williamhai@hotmail.com>
# Contributor: Martin Stibor <martin.von.reichenberg@protonmail.com>
# Maintainer: Martin Stibor <martin.von.reichenberg@protonmail.com>

pkgname='koi'
_pkgname='Koi'
pkgver=0.5
pkgrel=1
pkgdesc="Scheduled LIGHT/DARK Theme Switching for the KDE Plasma Desktop"
arch=('x86_64' 'aarch64')
url="https://github.com/baduhai/Koi"
license=('LGPL3')
depends=('gcc-libs' 'plasma-desktop' 'plasma-integration' 'plasma-workspace' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('gcc' 'qt6-base' 'qt6-tools' 'cmake' 'extra-cmake-modules' 'desktop-file-utils' 'fdupes')
optdepends=('xsettingsd: Apply settings to GTK applications on the fly'
            'kvantum: Powerful extra customisable themes')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('0dec287d7754c94923b9e4007a26219d')

build() {
    cmake -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr/" \
          -S "${srcdir}/${_pkgname}-${pkgver}/src/" \
          -B "${srcdir}/${_pkgname}-${pkgver}/build/"

    cmake --build "${srcdir}/${_pkgname}-${pkgver}/build/"
}

package() {
    cmake --install "${srcdir}/${_pkgname}-${pkgver}/build/"

# Checking `pkgdir` ...
    desktop-file-validate "${pkgdir}/usr/share/applications/local.${_pkgname}DbusInterface.desktop"
    fdupes -r -s          "${pkgdir}/"
}
