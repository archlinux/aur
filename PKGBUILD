# Maintainer: cyanolupus <admin@cyanolup.us>
pkgname="miraktest"
pkgver="2.0.0"
_suffix="-beta.3"
pkgrel=${_suffix/-beta./}
pkgdesc="Viewing application implementation research material for Mirakurun"
arch=('x86_64')
url="https://github.com/ci7lus/MirakTest"
license=('MIT')
depends=('vlc')
makedepends=('vlc' 'imagemagick')
_releasename="v${pkgver}${_suffix}"
_targzname="miraktest-${pkgver}${_suffix}"
source=(
    "https://github.com/ci7lus/MirakTest/releases/download/${_releasename}/${_targzname}.tar.gz"
    "https://raw.githubusercontent.com/ci7lus/MirakTest/feat/v2/assets/miraktest.ico"
)

package() {
    # pkgdir
    local _dirs
    _dirs=(
        "${pkgdir}/usr/lib/"
        "${pkgdir}/usr/bin/"
        "${pkgdir}/usr/share/applications/"
        "${pkgdir}/usr/share/pixmaps/"
    )
    mkdir -p ${_dirs[@]}

    # lib
    cp -r "${srcdir}/${_targzname}" "${pkgdir}/usr/lib/miraktest"

    # bin as symbolic link
    ln -s "${pkgdir}/usr/lib/miraktest/miraktest" "${pkgdir}/usr/bin/miraktest"
    chmod 755 "${pkgdir}/usr/bin/miraktest"

    # desktop
    touch "${pkgdir}/usr/share/applications/miraktest.desktop"
    echo '[Desktop Entry]
Encoding=UTF-8
Name=MirakTest
Icon=miraktest
Exec=miraktest
Type=Application
Terminal=false
MimeType=text/plain' > "${pkgdir}/usr/share/applications/miraktest.desktop"

    # Icon
    convert "${srcdir}/miraktest.ico" "${pkgdir}/usr/share/pixmaps/miraktest.png"
}

md5sums=('500af8a73ff6ec48fa6bc8893cf1a853'
         'de36cb346dc226f833159374452a5ad0')
