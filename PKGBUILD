pkgname=openelec-dvb-firmware
_pkgver=0.0.1
pkgver=88.4ded321
pkgrel=1
pkgdesc="Set of dvb firmwares from OpenElec project"
arch=('i686' 'x86_64')
url="https://github.com/OpenELEC/dvb-firmware.git"
license=('GPL3')
makedepends=('git diffutils')

_gitname=dvb-firmware
source=("git+https://github.com/OpenELEC/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    TARGET_DIR="${pkgdir}/usr/lib/firmware"
    mkdir -p $TARGET_DIR
    FIRMWARE_FILES=$(diff -rq "${_gitname}/firmware" /lib/firmware |grep "Only in ${_gitname}/firmware" |awk -F ": " '{ print $2 }' |tr '\n' ' ')
    for f in $FIRMWARE_FILES
    do 
        cp "${_gitname}/firmware/$f" $TARGET_DIR
    done
}
