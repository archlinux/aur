# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=trine3-hib
pkgver=2015.12.01
pkgrel=1
pkgdesc="action role-playing platform and puzzle video game. humblebundle version."
url="https://trine3.com"
arch=('x86_64')
license=('commercial')
depends=("")
install=trine3.install
source=("hib://trine3_linux.zip")
# there is a patch downloadable, but it is already included in the game
md5sums=('28070d73b2291c30e31b5ef486b9f3ac')
PKGEXT=".pkg.tar"
DLAGENTS+=('hib::/usr/bin/echo "Could not find %u. Manually download it to \"$(pwd)\", or set up a hib:// DLAGENT in /etc/makepkg.conf."; exit 1')
 
package() {
    # copy game files
    mkdir -p "${pkgdir}/opt/trine3"
    mv "${srcdir}/linux/"* "${pkgdir}/opt/trine3"

    # starter script
    mkdir -p "${pkgdir}/usr/bin"
    cat >> "${pkgdir}/usr/bin/trine3" << \here
#!/bin/sh
cd /opt/trine3
trine3.sh
here
    chmod a+x "${pkgdir}/usr/bin/trine3"
}
