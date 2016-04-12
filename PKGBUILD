# Maintainer: yaroslav <proninyaroslav@mail.ru>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=vivid

pkgname=ubuntu-themes
_actual_ver=14.04
_extra_ver=+16.04.20160324.1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc='Ubuntu monochrome icon theme, Ambiance and Radiance themes, and Ubuntu artwork'
arch=('any')
url="https://launchpad.net/ubuntu-themes"
license=('CCPL')
groups=('unity-extra')
depends=('humanity-icon-theme' 'adwaita-icon-theme' 'hicolor-icon-theme' 'gtk-engine-murrine')
makedepends=('python2' 'imagemagick' 'icon-naming-utils')
provides=('light-themes' 'ubuntu-mono')
conflicts=('light-themes' 'ubuntu-mono')
install=${pkgname}.install
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${_actual_ver}${_extra_ver}.orig.tar.gz")
sha256sums=('896a1223d5a8592969739f23514b4bd4ea1b561c9c58be6efb640722e68c5173')

build() {
    # Python 2 fix
    sed -i 's|^\(#!.*python$\)|\12|g' scavenge.py

    make
}

package() {
    # Install themes
    install -dm755   "${pkgdir}/usr/share/themes/"
    cp -av Ambiance/ "${pkgdir}/usr/share/themes/"
    cp -av Radiance/ "${pkgdir}/usr/share/themes/"

    # Install icons
    install -dm755            "${pkgdir}/usr/share/icons/"
    cp -av ubuntu-mono-dark/  "${pkgdir}/usr/share/icons/"
    cp -av ubuntu-mono-light/ "${pkgdir}/usr/share/icons/"
    cp -av LoginIcons/        "${pkgdir}/usr/share/icons/"
    cp -av suru-icons/        "${pkgdir}/usr/share/icons/"
    cp -av ubuntu-mobile/     "${pkgdir}/usr/share/icons/"

    mv "${pkgdir}"/usr/share/icons/{suru-icons,suru}/

    install -Dm644 distributor-logo.png \
            "${pkgdir}/usr/share/icons/hicolor/48x48/apps/distributor-logo.png"
}
