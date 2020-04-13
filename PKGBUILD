# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="layan-cursor-theme-git"
pkgver=0.0.0.7a37de2
pkgrel=4
pkgdesc='A x-cursor theme inspired by layan gtk theme and based on capitaine-cursors'
arch=("any")
url="https://github.com/vinceliuice/Layan-cursors"
license=("GPL3")
makedepends=("git")
provides=("layan-cursor-theme")
conflicts=("layan-cursor-theme")
source=("git+${url}.git")
b2sums=("SKIP")

pkgver()
{
    cd "Layan-cursors"
    if [ $(git tag|wc -l) == 0 ]; then
        echo "0.0.0.$(git log -1 --format='%h')"
    else
        git describe --tags | sed "s/-/.r/; s/-g/./"
    fi
}

package()
{
    if [ -z "${_cleancursordirname+x}" ]; then
        _cleancursordirname=false
    fi

    mkdir -p "${pkgdir}/usr/share/icons"
    
    cd "Layan-cursors"
    if [ "$_cleancursordirname" = "true" ]; then
        cp -r "dist" "${dst}/Layan Unraveled"
        cp -r "dist-border" "${dst}/Layan"
        cp -r "dist-white" "${dst}/Layan Reborn"
    else
        cp -r "dist" "${dst}/Layan-cursors"
        cp -r "dist-border" "${dst}/Layan-border-cursors"
        cp -r "dist-white" "${dst}/Layan-white-cursors"
    fi
}
