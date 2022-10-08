# Maintainer: Bruno Goncalves <bigbruno@gmail.com>

pkgname=big-store
pkgver=$(date +%y.%m.%d)
pkgrel=$(date +%H%M)
arch=('any')
license=('GPL')
url="https://github.com/biglinux/big-store"
pkgdesc="A friendly interface using bigbashview and that uses a large part of pamac resources to offer users a practical and simple interface"
depends=('pamac-gtk' 'jq' 'gawk' 'sed' 'yay' 'rxvt-unicode' 'xorg-xwininfo' 'bigbashview' 'ttf-comfortaa' 'xsetprop' 'xtermset' 'wmctrl' 'ttf-comfortaa' 'ttf-ubuntu-font-family' 'force-upgrade')
optdepends=('pamac-snap-plugin' 'pamac-flatpak-plugin')
source=("git+https://github.com/biglinux/big-store.git")
md5sums=(SKIP)


package() {
    # Verify default folder
    if [ -d "${srcdir}/${pkgname}/${pkgname}" ]; then
        InternalDir="${srcdir}/${pkgname}/${pkgname}"
    else
        InternalDir="${srcdir}/${pkgname}"
    fi


    # Copy files
    if [ -d "${InternalDir}/usr" ]; then
        cp -r "${InternalDir}/usr" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/etc" ]; then
        cp -r "${InternalDir}/etc" "${pkgdir}/"
    fi

    if [ -d "${InternalDir}/opt" ]; then
        cp -r "${InternalDir}/opt" "${pkgdir}/"
    fi

    # Add link to bin path
    mkdir "${pkgdir}/usr/bin"
    ln -s "/usr/share/bigbashview/bcc/apps/big-store/big-store-start.sh" "${pkgdir}/usr/bin/big-store"

}
