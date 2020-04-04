# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname=layan-cursor-theme-git
_reponame='Layan-cursors'
pkgver=0.0.0.7a37de2
pkgrel=1
pkgdesc='A x-cursor theme inspired by layan gtk theme and based on capitaine-cursors.'
arch=("any")
provides=("layan-cursor-theme")
conflicts=("layan-cursor-theme")
url="https://github.com/vinceliuice/${_reponame}"
license=("GPL3")
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
    dst="${pkgdir}/usr/share/icons"
    mkdir -p "${dst}"
    cd "${srcdir}/${_reponame}"
    cp -r dist/ "${dst}/Layan-cursors"
    cp -r dist-border/ "${dst}/Layan-border-cursors"
    cp -r dist-white/ "${dst}/Layan-white-cursors"
}
