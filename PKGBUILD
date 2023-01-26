# Maintainer: Gabriel Felipe Huwe <gabrielhuwe at gmail dot com>

pkgname=dracula-kde-theme-git
_pkgname=${pkgname%-git}
_install_name=Dracula
_branch=master
pkgver=r297.a85f789
pkgrel=1
pkgdesc='Dark theme for KDE (includes window decorations, color schemes, Plasma theme, cursor theme, Kvantum theme and SDDM theme)'
arch=('any')
url='https://github.com/dracula/gtk'
license=('GPL')
makedepends=(git)
optdepends=('ttf-roboto: primary font face defined'
            'ttf-ubuntu-font-family: secondary font face defined'
            'cantarell-fonts: tertiary font face defined')
source=("$_pkgname::git+$url.git#branch=$_branch")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | \
          sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/aurorae/themes"
    cp -a "${srcdir}/${_pkgname}/kde/aurorae/"* "${pkgdir}/usr/share/aurorae/themes/"

    mkdir -p "${pkgdir}/usr/share/color-schemes"
    cp -a "${srcdir}/${_pkgname}/kde/color-schemes/"* "${pkgdir}/usr/share/color-schemes"

    mkdir -p "${pkgdir}/usr/share/Kvantum"
    cp -a "${srcdir}/${_pkgname}/kde/kvantum/"* "${pkgdir}/usr/share/Kvantum/"

    mkdir -p "${pkgdir}/usr/share/plasma"
    cp -a "${srcdir}/${_pkgname}/kde/plasma/"* "${pkgdir}/usr/share/plasma/"

    mkdir -p "${pkgdir}/usr/share/sddm/themes"
    cp -a "${srcdir}/${_pkgname}/kde/sddm/"* "${pkgdir}/usr/share/sddm/themes/"

    mkdir -p "${pkgdir}/usr/share/icons/${_install_name}-cursors/"
    cp -a "${srcdir}/${_pkgname}/kde/cursors/${_install_name}-cursors/"* "${pkgdir}/usr/share/icons/${_install_name}-cursors/"
}
