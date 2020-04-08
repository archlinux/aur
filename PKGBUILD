# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname=kayan-gtk-theme-git
_reponame='Krayan'
pkgver=0.0.0.69e7f60
pkgrel=1
pkgdesc='A darker and more modern twist on the Layan GTK Theme.'
arch=("any")
provides=("kayan-gtk-theme")
conflicts=("kayan-gtk-theme")
url="https://github.com/lazerl0rd/${_reponame}"
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
