# Maintainer: Andrea Denisse Gómez-Martínez <denisse at archlinux dot org>

pkgname=dracula-gtk-theme-git
_pkgname=${pkgname%-git}
_install_name=Dracula
_branch=master
pkgver=r158.dcd159f
pkgrel=1
pkgdesc='Dark theme for GTK'
arch=('any')
url='https://github.com/dracula/gtk'
license=('GPL')
makedepends=(git)
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'ttf-roboto: primary font face defined'
            'ttf-ubuntu-font-family: secondary font face defined'
            'cantarell-fonts: tertiary font face defined')
source=("$_pkgname::git+$url.git#branch=$_branch")
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long 2>/dev/null | \
          sed's/\([^-]*-g\)/r\1/;s/-/./g' || \
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd "${srcdir}/${_pkgname}"

    mkdir -p "${pkgdir}/usr/share/themes/${_install_name}"
    cp -a "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/share/themes/${_install_name}/"
}
