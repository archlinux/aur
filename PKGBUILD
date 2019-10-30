# Maintainer: Víctor González <mrvikxd@gmail.com>

pkgname=layan-gtk-theme-git
_reponame='Layan-gtk-theme'
pkgver=0.0.0.493cf28
pkgrel=1
pkgdesc='An Flat Gtk+ theme based on Material Design'
arch=("any")
url="https://github.com/vinceliuice/Layan-gtk-theme"
license=("GPL2")
optdepends=(
        "gtk-engine-murrine"
        "gtk-engines"
)
makedepends=("git")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver(){
    cd "${srcdir}/${_reponame}"
    if [ $(git tag|wc -l) == 0 ]; then
        echo "0.0.0.$(git log -1 --format='%h')"
    else
        git describe --tags | sed 's/-/.r/; s/-g/./'
    fi
}

package() {
    dst="${pkgdir}/usr/share/themes"
    mkdir -p "${dst}"
    cd "${srcdir}/${_reponame}"
    ./install.sh -d "${dst}"
}
