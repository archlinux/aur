# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=refind-theme-tux-git
pkgver=r85.e6c9f05
pkgrel=1
pkgdesc="Ubuntu is nice but it needs a little Tux. Here he is, the man himself in the boot loader as a rEFInd theme."
arch=('any')
url="https://github.com/pradyumnasagar/tux4ubuntu/tree/master/tux-refind-theme"
license=('none')
depends=('refind-efi')
makedepends=('git')
source=('git+https://github.com/pradyumnasagar/tux4ubuntu.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/tux4ubuntu"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    REFIND_HOME="${pkgdir}/boot/EFI/refind"

    mkdir -p "${REFIND_HOME}/themes/tux"
    cp -r "${srcdir}/tux4ubuntu/tux-refind-theme/" "${REFIND_HOME}/themes/tux/"
    chmod -R 644 "${REFIND_HOME}/themes/tux"

    echo 'Remember to add "include themes/tux/theme.conf" to your refind.conf file'
}
