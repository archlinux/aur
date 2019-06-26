# Maintainer: Edward Pacman <edward at edward-p dot xyz>

_srcname=canta-kde
pkgname=canta-kde-git
pkgdesc="Canta theme for kde plasma desktop"
pkgver=r6.e2e8841
pkgrel=1
arch=('any')
url="https://github.com/vinceliuice/Canta-kde"
license=('GPL')
depends=()
makedepends=('git')
optdepends=('canta-gtk-theme-git' 'canta-icon-theme-git' 'kvantum-qt5')

source=("${_srcname}::git+https://github.com/vinceliuice/Canta-kde.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_srcname}"
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare(){
    cd "${srcdir}/${_srcname}"
    sed -i 's,$HOME/.local/share,'"${pkgdir}"'/usr/share,g' install.sh
    sed -i 's,$HOME/.config,'"${pkgdir}"'/usr/share,g' install.sh

}
package() {
    #Install kde theme
    cd "${srcdir}/${_srcname}"
    mkdir -p "${pkgdir}/usr/share/"{aurorae/themes,color-schemes,plasma/desktoptheme,plasma/look-and-feel}
    ./install.sh
    
    #Install sddm theme
    cd sddm
    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    cp -ur Canta "${pkgdir}/usr/share/sddm/themes"
}

